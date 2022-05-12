# frozen_string_literal: true

require_relative 'train'

class CargoTrain < Train
  def initialize(number, type = 'cargo')
    @number = number.to_s
    @type = type
    super
  end
end
