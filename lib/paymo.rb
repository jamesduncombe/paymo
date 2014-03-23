require 'paymo/version'
require 'rest_client'
require 'json'

module Paymo

  # Pull in our dependencies
  ['/paymo/*.rb', '/paymo/models/*.rb', '/paymo/resources/*.rb'].each do |path|
    Dir[File.dirname(__FILE__) + path].each { |f| require_relative f }
  end

  API_ENDPOINT = 'https://api.paymo.biz/service/'

  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
  end

  class Configuration
    attr_accessor :api_key, :debug, :auth_token

    def initialize
      @api_key  = ENV['PAYMO_API_KEY']
      @debug    = false
      @auth_token = nil
    end
  end

  class Base

    def initialize(options = {})
      @username = options[:username]
      @password = options[:password]
      @format   = options[:format] || 'json'
      self.auth
    end

    def auth
      response = Paymo::API.post :auth, :login, {
        format: @format,
        username: @username,
        password: @password,
        api_key: Paymo.config.api_key
      }
      # add error checking
      Paymo.config.auth_token = response['token']['_content']
    end

  end

end
