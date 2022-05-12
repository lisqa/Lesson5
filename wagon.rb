# frozen_string_literal: true

require_relative 'productcompany'

class Wagon
  include ProductCompany
  attr_accessor :type, :number

  def putswagon(wagon)
    if wagon.type == 'cargo'
      puts " WagonNumber = #{wagon.number}, occupied V = #{wagon.occupied_volume}, free V = #{wagon.free_volume}"
    else
      puts " WagonNumber = #{wagon.number}, occupied seats = #{wagon.occupied_seats}, free seats = #{wagon.free_seats}"
    end
  end
end
