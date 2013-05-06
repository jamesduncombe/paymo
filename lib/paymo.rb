require 'paymo/version'
require 'rest_client'
require 'json'

module Paymo
  require_relative './paymo/api.rb'
  require_relative './paymo/resources/entries.rb'

  API_ENDPOINT = 'https://api.paymo.biz/service/'

  class << self

    attr_writer :auth_token
    
    def api_key
      ENV['PAYMO_API_KEY']
    end

    def auth_token
      @auth_token ||= ''
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
      response = Paymo::API.post :auth_login, {
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
