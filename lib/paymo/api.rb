module Paymo
  class API

    def self.get(resource, options = {})
      puts "curl -X GET -H 'X-Session: #{Paymo.config.session_id}' -H 'Accept: application/json' \
            #{API_ENDPOINT}#{resource}#{options}" if Paymo.config.debug

      request = RestClient::Request.new(
        url: "#{API_ENDPOINT}#{resource}#{options}",
        method: 'get',
        headers: { accept: 'json', 'X-Session' => Paymo.config.session_id }
      )

      JSON.parse(request.execute)
    end

    def self.post(resource, options = {})
      if resource == :sessions
        curl_request = "-u '#{options[:username]}:#{options[:password]}'"

        other_headers = {
          headers: { accept: 'json' },
          user: options[:username], password: options[:password]
        }

      else
        curl_request = "-H 'X-Session: #{Paymo.config.session_id}'"

        other_headers = {
          headers: { accept: 'json', 'X-Session' => Paymo.config.session_id }
        }
      end

      request = RestClient::Request.new({
        url: "#{API_ENDPOINT}#{resource}",
        method: 'post'}.merge!( other_headers ))

      puts "curl -X POST #{curl_request} -H 'Accept: application/json' \
              #{API_ENDPOINT}#{resource}" if Paymo.config.debug

      JSON.parse(request.execute)

    end
  end
end
