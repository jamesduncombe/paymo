module Paymo
  class API

    def self.methodize(resource, method)
      method = method.to_s.gsub(/_([a-z]{1})/) { "#{$1.upcase}" }
      "#{resource}.#{method}"
    end

    def self.get(resource, method, options = {})
      method = methodize(resource, method)
      options.merge!({ auth_token: Paymo.auth_token, api_key: Paymo.api_key, format: 'json' })
      json = RestClient.get "#{API_ENDPOINT}paymo.#{method}", { params: options }
      JSON.parse(json)
    end

    def self.post(resource, method, options = {})
      method = methodize(resource, method)
      options.merge!({ auth_token: Paymo.auth_token, api_key: Paymo.api_key, format: 'json' })
      json = RestClient.post "#{API_ENDPOINT}paymo.#{method}", options
      JSON.parse(json)
    end
  end
end