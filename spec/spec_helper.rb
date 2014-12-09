
require 'rubygems'
require 'bundler/setup'
require 'webmock'
require 'vcr'
require 'awesome_print'
require 'paymo'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end

Paymo.configure do |c|
  c.debug = true
end
