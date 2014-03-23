# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paymo/version'

Gem::Specification.new do |gem|
  gem.name          = "paymo"
  gem.version       = Paymo::VERSION
  gem.authors       = ["James Duncombe"]
  gem.email         = ["james@jamesduncombe.com"]
  gem.description   = "Ruby wrapper for the Paymo API"
  gem.summary       = "Simple way to interact with the Paymo API"
  gem.homepage      = "https://github.com/jamesduncombe/paymo"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features|fixtures)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'rest-client', '~> 1.6'
end
