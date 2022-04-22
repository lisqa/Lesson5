require_relative 'train'

class PassengerTrain < Train
  ClassMethods.start_instance(self)

  def initialize(number, type = "passenger")
    @number = number.to_s 
    @type = type
    super
  end
end
