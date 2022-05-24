require_relative 'instancecounter'
require_relative 'accessors'
require_relative 'validation'

class Station
  include InstanceCounter
  include Accessors
  extend Accessors
  include Validation

  attr_reader :trains, :station_name

  STATION_FORMAT = /^([a-z]|\d){1,}$/i.freeze

  validations
  validate :station_name, :presence
  validate :station_name, :format, STATION_FORMAT
  validate :station_name, :type, String

  @@all_stations = []

  def station_block(&block)
    @trains.each(&block)
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
    @trains.select { |train| type == train.type }
  end

  def count_trains_by(type)
    trains_by(type).length
  end

  def train_leaves(train)
    @trains.delete(train)
  end

  # public хотя не нужен пользователю, но используется в другом классе в открытом методе (вперед/назад поезд)
  def station_index(route)
    route.list_of_stations.index(self)
  end
=begin
  protected

  def validate!
    raise 'Station name is invalid' if station_name !~ STATION_FORMAT
  end
=end
end
