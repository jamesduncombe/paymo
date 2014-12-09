module Paymo
  class Base

    def relationships(result)
      result.each_pair do |k, v|
        if v.class == Hash
          instance_variable_set("@#{k}", Object.const_get("Paymo::#{k.capitalize}").new(v))
          self.class.send(:attr_accessor, k.to_sym)
        end
      end
    end

  end
end
