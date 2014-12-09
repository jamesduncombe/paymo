module Paymo
  class Task < Base

    attr_accessor :id, :name

    def initialize(result)
      @id          = result['id'].to_i
      @name        = result['name']
      relationships(result)
    end

  end
end
