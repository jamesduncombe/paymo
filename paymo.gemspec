# -*- encoding: utf-8 -*-
require File.expand_path('../lib/paymo/version', __FILE__)

Gem::Specification.new do |gem|
  
  gem.name          = "paymo"
  gem.version       = Paymo::VERSION

  gem.authors       = ["James Duncombe"]
  gem.email         = ["james@jamesduncombe.com"]
  
  gem.description   = "Ruby wrapper for the Paymo API"
  gem.summary       = "Simple way to interact with the Paymo API"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'rest-client', '~> 1.6.7'
  
end
