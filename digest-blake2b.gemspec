# frozen_string_literal: true

lib = File.expand_path('lib', __dir__).freeze
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib

require 'digest/blake2b/version'

Gem::Specification.new do |spec|
  spec.name     = 'digest-blake2b'
  spec.version  = Digest::Blake2b::VERSION
  spec.license  = 'GPL-3.0'
  spec.homepage = 'https://github.com/kotovalexarian/digest-blake2b.rb'
  spec.summary  = 'The BLAKE2b cryptographic hash function.'

  spec.required_ruby_version = '~> 2.1'

  spec.authors = ['Franck Verrot', 'Mauricio Gomes']
  spec.email   = %w[mauricio@edge14.com]

  spec.description = <<-DESCRIPTION.split.join ' '
    BLAKE2b is a cryptographic hash function
    faster than MD5, SHA-1, SHA-2, and SHA-3 for 64-bit systems.
  DESCRIPTION

  spec.metadata = {
    'homepage_uri'    => 'https://github.com/kotovalexarian/digest-blake2b.rb',
    'source_code_uri' => 'https://github.com/kotovalexarian/digest-blake2b.rb',
    'bug_tracker_uri' =>
      'https://github.com/kotovalexarian/digest-blake2b.rb/issues',
  }.freeze

  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match %r{^(test|spec|features)/}
  end

  spec.test_files = spec.files.grep %r{^(test|spec|features)/}

  spec.executables = spec.files.grep %r{^exe/}, &File.method(:basename)

  spec.extensions << 'ext/blake2b_ext/extconf.rb'

  spec.add_development_dependency 'rake-compiler', '~> 0.9'
  spec.add_development_dependency 'bundler'      , '~> 1.5'
  spec.add_development_dependency 'rake'         , '~> 11.1'
  spec.add_development_dependency 'minitest'     , '~> 5.11'
end
