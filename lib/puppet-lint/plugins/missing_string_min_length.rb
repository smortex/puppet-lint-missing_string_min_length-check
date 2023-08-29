# frozen_string_literal: true

PuppetLint.new_check(:missing_string_min_length) do
  def check
    tokens.each do |token|
      case token.type
      when :TYPE
        check_string(token) if token.value == 'String'
      end
    end
  end

  def check_string(token)
    return if token.next_code_token.type == :LBRACK && token.next_code_token.next_code_token.type == :NUMBER

    notify :warning, {
      message: 'String has no minimum length',
      line: token.line,
      column: token.column,
      token: token,
    }
  end
end
