module InstanceCounter

    def self.included(base)
      base.extend ClassMethods
    end    

    protected

    def register_instance(one_class)
      one_class.instances += 1
    end
  
  module ClassMethods
    attr_accessor :instances

    def self.start_instance(one_class)
      one_class.instances = 0
    end

    def self.instances(one_class)   
      one_class.instances
    end
  end
end
