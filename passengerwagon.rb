# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  attr_accessor :occupied_seats

  def initialize(seats)
    @seats = seats.to_i
    @occupied_seats = 0
  end

  def occupy_seat
    @occupied_seats += 1
  end

  def free_seats
    @free_seats = @seats - @occupied_seats
  end

  def type
    @type = 'passenger'
  end
end
