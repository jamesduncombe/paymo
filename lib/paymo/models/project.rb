module Paymo
  class Project

    attr_accessor :id, :retired, :name, :description, :budget_hours,
                  :price_per_hour, :client_id, :client_name, :users

    def initialize(result)
      @id             = result['id'].to_i
      @retired        = !!result['retired']
      @name           = result['name']['_content']
      @description    = result['description']['_content']
      @budget_hours   = result['budget_hours']['_content'].to_f
      @price_per_hour = result['price_per_hour']['_content'].to_f
      @client_id      = result['client']['id'].to_i
      @client_name    = result['client']['name']
      @users          = result['users']
    end
  end
end