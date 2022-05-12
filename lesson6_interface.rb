# frozen_string_literal: true

require_relative 'instancecounter'
require_relative 'productcompany'
require_relative 'train'
require_relative 'passengertrain'
require_relative 'cargotrain'
require_relative 'wagon'
require_relative 'passengerwagon'
require_relative 'cargowagon'
require_relative 'station'

class TrainInterface
  def run
    train_create
  end

  private

  def train_create
    puts 'Введите номер поезда в формате три буквы или цифры в любом порядке, необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса'
    number = gets.chomp
    puts 'Введите тип поезда: cargo or passenger?'
    type = gets.chomp
    train = Train.new(number, type)
  rescue RuntimeError => e
    false
    puts e.inspect.to_s
  end
end

c1 = CargoWagon.new(30)
c1.number = '1'
c2 = CargoWagon.new(20)
c2.number = '2'
c1.occupy_volume(10)
# puts "occupy #{c1.occupied_volume} и free #{c1.free_volume}"
p1 = PassengerWagon.new(25)
p1.number = '10'
p2 = PassengerWagon.new(15)
p2.number = '12'
p1.occupy_seat
p1.occupy_seat
p1.occupy_seat
# puts "occupy #{p1.occupied_seats} и free #{p1.free_seats}"

tc1 = CargoTrain.new('12345')
tp2 = PassengerTrain.new('67890')
tc1.stop
tp2.stop
tc1.add_wagons(c1)
tc1.add_wagons(c2)
tp2.add_wagons(p1)
tp2.add_wagons(p2)

s1 = Station.new('1')
s2 = Station.new('2')
s1.train_comes(tc1)
s2.train_comes(tp2)

puts 'Список станций и поездов на них:'
Station.all.each do |station|
  puts "На станции #{station.station_name} находятся поезда: "
  station.trains.each do |train|
    puts "TrainNumber = #{train.number}, type = #{train.type}, wagons = #{train.wagons.length}"
  end
end

puts 'Поезда и вагоны:'

Train.all.each do |train|
  puts "Train number #{train.number}"
  train.wagons.each { |wagon| wagon.putswagon(wagon) }
end
