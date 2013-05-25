class Cache

  def initialize(instance, method)
    @data     = {}
    @instance = instance
    @method   = method
  end

  def get(key)
    begin
      @data.fetch(key)
    rescue KeyError
      set(key)
      get(key)
    end
  end

  def set(key)
    @data.store key, value(key)
  end

  private

    def value(key)
      @instance.get_info(key).send @method
    end

end