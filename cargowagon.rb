require_relative 'wagon'

class CargoWagon < Wagon 
  attr_accessor :occupied_volume

  def initialize(volume)
    @volume = volume.to_i
    @occupied_volume = 0
  end

  def occupy_volume(volume)
    @occupied_volume += volume.to_i
  end

  def free_volume
    @free_volume = @volume - @occupied_volume
  end

  def type
    @type = "cargo"
  end
end
