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

    attr_writer :auth_token, :debug

    def api_key
      ENV['PAYMO_API_KEY']
    end

    def auth_token
      @auth_token ||= ''
    end

    def debug
      @debug ||= false
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
        api_key: Paymo.api_key
      }
      # add error checking
      Paymo.auth_token = response['token']['_content']
    end

  end

end
