module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end  

  module ClassMethods
    attr_accessor :instances

    def self.start_instance(one_class)
      one_class.instances ||= 0
    end
  end

  module InstanceMethods

    def register_instance(one_class)
      ClassMethods.start_instance(one_class)  
      one_class.instances += 1
    end
  end
end
