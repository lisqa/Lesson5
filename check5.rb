require_relative 'instancecounter'
require_relative 'productcompany'
require_relative 'route'
require_relative 'wagon'
require_relative 'passengerwagon'
require_relative 'cargowagon'
require_relative 'station'
require_relative 'train'
require_relative 'passengertrain'
require_relative 'cargotrain'

s1 = Station.new("1")
s2 = Station.new("2")
s3 = Station.new("3")

puts "Station instances = #{Station.instances}"
puts "all stations: #{Station.all}"


r12 = Route.new(s1, s2)
r13 = Route.new(s1, s3)

puts "Route instances = #{Route.instances}"

wc = CargoWagon.new
wp = PassengerWagon.new
w1 = Wagon.new
wc.product_company = "sumsung"
puts "#{wc.product_company}"

t1 = Train.new("1", "cargo")
t2 = PassengerTrain.new("2")
t3 = CargoTrain.new("3")
t4 = Train.new("4", "passenger")


puts "find train 1 = #{Train.find("1")}"
puts "find train 8 = #{Train.find("8")}"
puts "Train.instances = #{Train.instances}"
puts "CargoTrain.instances = #{CargoTrain.instances}"
puts "PassengerTrain.instances = #{PassengerTrain.instances}"




