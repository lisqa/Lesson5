require_relative 'instancecounter'
require_relative 'productcompany'
require_relative 'wagon'
require_relative 'passengerwagon'
require_relative 'cargowagon'
require_relative 'accessors'
require_relative 'validation'

class Train
  include ProductCompany
  include InstanceCounter
  include Accessors
  extend Accessors
  include Validation

  attr_accessor :speed, :number, :type, :wagons, :train_station, :instance

  @@all_trains = []

  TRAIN_NUMBER_FORMAT = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i.freeze
  TRAIN_TYPE = /^(cargo|passenger)$/i.freeze

  validations
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT
  validate :type, :format, TRAIN_TYPE
  validate :type, String

  def train_block(&block)
    @wagons.each(&block)
  end

  def self.all
    @@all_trains
  end

  def self.find(number)
    @@all_trains.find { |train| train.number == number }
  end

  def initialize(number, type)
    @number = number.to_s
    @type = type
    validate!
    @wagons = []
    @@all_trains << self
    register_instance
  end

  def go(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_wagons(wagon)
    @wagons << wagon if @speed.zero? && @type == wagon.type
  end

  def remove_wagons(wagon)
    @wagons.delete(wagon) if @speed.zero?
  end

  def train_route(route)
    @train_route = route
    @train_station = @train_route.list_of_stations[0]
    @train_station.train_comes(self)
  end

  def current_station
    @train_route.list_of_stations[station_number(@train_station)]
  end

  def go_next
    if @train_station != @train_route.list_of_stations[-1] # проверка не конечная ли станция?
      @train_station.train_leaves(self)
      @train_station = next_station     # текущая станция меняется на следующую станцию
      @train_station.train_comes(self)
    else
      @train_station = current_station
    end
  end

  def go_back
    if station_number(@train_station).positive?
      @train_station.train_leaves(self)
      @train_station = back_station
      @train_station.train_comes(self)
    else
      @train_station = current_station
    end
  end

  def next_station
    @train_route.list_of_stations[station_number(@train_station) + 1] if @train_station != @train_route.list_of_stations[-1]
  end

  def back_station
    @train_route.list_of_stations[station_number(@train_station) - 1] if station_number(@train_station).positive?
  end

  def station_number(station)
    station.station_index(@train_route)
  end

=begin
  protected

  def validate!
    raise 'Number has invalid format' if number !~ TRAIN_NUMBER_FORMAT
    raise 'Type is not valid' if type !~ TRAIN_TYPE
  end
=end
end
