require 'paymo/version'
require 'rest_client'
require 'json'

module Paymo

  # Pull in our dependencies
  ['/paymo/*.rb', '/paymo/models/*.rb', '/paymo/resources/*.rb'].each do |path|
    Dir[File.dirname(__FILE__) + path].each { |f| require_relative f }
  end

  API_ENDPOINT = 'https://app.paymoapp.com/api/'

  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
  end

  class Configuration
    attr_accessor :debug, :session_id

    def initialize
      @debug    = false
      @auth_token = nil
    end
  end

  class Base

    def initialize(options = {})
      @username = options[:username]
      @password = options[:password]
      self.auth
    end

    def auth
      response = Paymo::API.post :sessions, username: @username, password: @password

      # add error checking
      Paymo.config.session_id = response['sessions'][0]['id']
    end

  end

end
