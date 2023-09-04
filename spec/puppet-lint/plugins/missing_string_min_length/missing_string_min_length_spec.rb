# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'missing_string_min_length' do # rubocop:disable RSpec/DescribeClass
  let(:msg) { 'String has no minimum length' }

  context 'with fix disabled' do
    context 'when minimum length is provided' do
      let(:code) do
        <<~CODE
          class acme (
            String[1] $with_min_length,
            String[8, 31] $with_min_and_max,
          ) {
            if $facts['foo'] =~ String[0] {
            }
          }
        CODE
      end

      it 'does not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'when minimum length is not provided' do
      let(:code) do
        <<~CODE
          class acme (
            String $without_min_length,
            String[default, 42] $without_min_but_with_max,
          ) {
            if $facts['foo'] =~ String {
            }
          }
        CODE
      end

      it 'has problems' do
        expect(problems).to have(3).problem
      end

      it 'warns about $without_min_length' do
        expect(problems).to contain_warning(msg).on_line(2).in_column(3)
      end

      it 'warns about $without_min_but_with_max' do
        expect(problems).to contain_warning(msg).on_line(3).in_column(3)
      end

      it 'warns about =~ String' do
        expect(problems).to contain_warning(msg).on_line(5).in_column(23)
      end
    end
  end
end
