# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hammy/version"

Gem::Specification.new do |spec|
  raise "RubyGems 2.0 or newer is required!" unless spec.respond_to?(:metadata)

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.name = "hammy"
  spec.version = Hammy::VERSION
  spec.authors = ["Erik Kessler"]
  spec.email = ["erik.kessler1@gmail.com"]

  spec.summary = "Some Ruby utils and fun."
  spec.description = spec.summary
  spec.homepage = "https://github.com/erikkessler1/hammy"

  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-rubocop"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "rubocop"
end
