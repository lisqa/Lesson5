require_relative 'instancecounter'
require_relative 'productcompany'
require_relative 'train'
require_relative 'passengertrain'
require_relative 'cargotrain'
require_relative 'wagon'
require_relative 'passengerwagon'
require_relative 'cargowagon'

class TrainInterface

  def run
    train_create
  end

private

  def train_create
    puts "Введите номер поезда в формате три буквы или цифры в любом порядке, необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса"
    number = gets.chomp   
    puts "Введите тип поезда: cargo or passenger?"
    type = gets.chomp 
    train = Train.new(number, type)    
    rescue RuntimeError => e
      self.run
  end
end

traininterface = TrainInterface.new
traininterface.run

