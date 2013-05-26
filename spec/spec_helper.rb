
require 'rubygems'
require 'bundler/setup'
require 'webmock'
require 'vcr'
require 'paymo'

RSpec.configure do |config|
  config.color_enabled = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end
