module Paymo
  class Reports

    def create(options = {})
      if options[:start]
        options[:start] = options[:start].strftime('%Y-%m-%d %H:%M:%S')
      end
      if options[:end]
        options[:end] = options[:end].strftime('%Y-%m-%d %H:%M:%S')
      end
      result = Paymo::API.post :reports, :create, options
      if result['status'] == 'ok'
        results
      end
    end

  end
end