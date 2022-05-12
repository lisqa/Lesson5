require_relative 'productcompany'

class Wagon
  include ProductCompany
  attr_accessor :type, :number, :occupied_seats, :occupied_volume

  def initialize(options = {})
    @number = options[:number].to_i
    @type = options[:type]
    @seats = options[:seats].to_i
    @volume = options[:volume].to_i
  end

  def putswagon(wagon)
    if wagon.type == 'cargo'
      puts " WagonNumber = #{wagon.number}, occupied volume = #{wagon.occupied_volume}, free volume = #{wagon.free_volume}"
    else
      puts " WagonNumber = #{wagon.number}, occupied seats = #{wagon.occupied_seats}, free seats = #{wagon.free_seats}"
    end
  end
end
