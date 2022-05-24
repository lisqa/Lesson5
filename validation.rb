module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations
    
    def validate(name1, type, *args)
      @validations ||= []
      @validations << { name: name1, type: type, args: args }
    end
  end
  

  module InstanceMethods    
    def validate!      
      self.class.validations.each { |validation|
        validate = (validation[:type]).to_s
        args = validation[:args]
        validation = instance_variable_get("@#{validation[:name]}".to_sym)
        send(validate, validation, *args)
      }
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def presence(value)
      raise "Значение не должно быть пустым" if value.nil?
    end

    def format(value, format1)
      raise "Значение не соответствует формату" if value !~ format1
    end

    def type(value, type)
      raise "Объект не соответствует классу" unless value.is_a?(type)
    end
  end
end
