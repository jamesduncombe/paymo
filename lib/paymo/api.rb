module Paymo
  class API

    def self.get(method, options = {})
      method = method.to_s.gsub('_', '.')
      options.merge!({ auth_token: Paymo.auth_token, api_key: Paymo.api_key, format: 'json' })
      json = RestClient.get "#{API_ENDPOINT}paymo.#{method}", { params: options }
      JSON.parse(json)
    end

    def self.post(method, options = {})
      method = method.to_s.gsub('_', '.')
      options.merge!({ auth_token: Paymo.auth_token, api_key: Paymo.api_key, format: 'json' })
      json = RestClient.post "#{API_ENDPOINT}paymo.#{method}", options
      JSON.parse(json)
    end
  end
end