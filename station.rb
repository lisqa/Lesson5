require_relative 'instancecounter'

class Station
 include InstanceCounter

  attr_reader :trains, :station_name

  STATION_FORMAT = /^([a-z]|\d){1,}$/i

  @@all_stations = []

  def train_block(block)
    @trains.each { |train| block }
  end

  def self.all
    @@all_stations
  end

  def initialize(station)
    @station_name = station
    validate!
    @trains = []    
    @@all_stations << self
    register_instance
  end

  def train_comes(train)
    @trains << train
  end

  def trains_by(type)
    @trains.select {|train| type == train.type}    
  end

  def count_trains_by(type)
    self.trains_by(type).length    
  end

  def train_leaves(train)
    @trains.delete(train)
  end

  def station_index(route) #public хотя не нужен пользователю, но используется в другом классе в открытом методе (вперед/назад поезд)
    route.list_of_stations.index(self)
  end

  protected

  def validate!    
    raise "Station name is invalid" if station_name !~ STATION_FORMAT
  end
end
