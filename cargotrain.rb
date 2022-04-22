require_relative 'train'

class CargoTrain < Train
  
  ClassMethods.start_instance(self)
  
  def initialize(number, type = "cargo")
    @number = number.to_s 
    @type = type
    super
  end
end
