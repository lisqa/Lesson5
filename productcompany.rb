module ProductCompany
  attr_accessor :product_company

  def input_product_company
    puts "Укажите название компании-производителя"
    @product_company = gets.chomp
  end
end
