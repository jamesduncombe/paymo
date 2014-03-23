module Paymo
  class API

    def self.methodize(resource, method)
      method = method.to_s.gsub(/_([a-z]{1})/) { "#{$1.upcase}" }
      "#{resource}.#{method}"
    end

    def self.get(resource, method, options = {})
      method = methodize(resource, method)
      options.merge!({ auth_token: Paymo.config.auth_token, api_key: Paymo.config.api_key, format: 'json' })
      puts "curl #{API_ENDPOINT}paymo.#{method}?#{URI.encode_www_form(options)}" if Paymo.config.debug
      json = RestClient.get "#{API_ENDPOINT}paymo.#{method}", { params: options }
      JSON.parse(json)
    end

    def self.post(resource, method, options = {})
      method = methodize(resource, method)
      options.merge!({ auth_token: Paymo.config.auth_token, api_key: Paymo.config.api_key, format: 'json' })
      puts "curl -X POST -d '#{URI.encode_www_form(options)}' #{API_ENDPOINT}paymo.#{method}" if Paymo.config.debug
      json = RestClient.post "#{API_ENDPOINT}paymo.#{method}", options
      JSON.parse(json)
    end
  end
end
