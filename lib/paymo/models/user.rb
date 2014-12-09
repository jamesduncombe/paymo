module Paymo
  class User < Base

    attr_accessor :id, :is_online, :email, :name

    def initialize(result)
      @id             = result['id'].to_i
      @is_online      = result['is_online']
      @email          = result['email']
      @name           = result['name']
      relationships(result)
    end

  end
end
