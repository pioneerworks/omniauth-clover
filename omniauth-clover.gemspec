# frozen_string_literal: true

require "English"

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omni_auth/clover/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-clover"
  spec.version = OmniAuth::Clover::VERSION
  spec.authors = ["David Yun"]
  spec.email = ["davidy@gmail.com"]
  spec.description = "Clover OAuth2 Strategy for Omniauth"
  spec.summary = "Clover OAuth2 Strategy for Omniauth"
  spec.homepage = "https://github.com/davidy/omniauth-clover.git"
  spec.license = "MIT"

  spec.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "omniauth-oauth2", "~> 1.4.0"

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "standard"
end
