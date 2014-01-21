# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pipely/generators/version'

Gem::Specification.new do |spec|
  spec.name          = "pipely-generators"
  spec.version       = Pipely::Generators::VERSION
  spec.authors       = ["Matt Gillooly"]
  spec.email         = ["matt@swipely.com"]
  spec.description   = %q{Helpers for generating new Pipely projects}
  spec.summary       = %q{Helpers for generating new Pipely projects}
  spec.homepage      = "http://github.com/swipely/pipely-generators"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "cane"
  spec.add_dependency "thor"
end
