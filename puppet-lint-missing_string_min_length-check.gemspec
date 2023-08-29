# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-missing_string_min_length-check'
  spec.version     = '0.0.0'
  spec.homepage    = 'https://github.com/voxpupuli/puppet-lint-missing_string_min_length-check'
  spec.license     = 'Apache-2.0'
  spec.author      = 'Vox Pupuli'
  spec.email       = 'voxpupuli@groups.io'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.summary = 'A puppet-lint plugin to check that String data types have an explicit minimum length.'

  spec.required_ruby_version = '>= 2.7.0'

  spec.add_dependency 'puppet-lint', '>= 3.0', '< 5'
end
