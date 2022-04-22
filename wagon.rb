require_relative 'productcompany'

class Wagon
  include ProductCompany
  attr_accessor :type 
end
