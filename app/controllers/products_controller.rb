class ProductsController < ApplicationController

  def index 
    @products = Product.all
    @products1 = []
    @products2 = []
    @products3 = []
    @products.each_with_index do |product, index| 
      if index%3 == 0
        @products1 << product 
      elsif index%3 == 1
        @products2 << product 
      elsif index%3 == 2
        @products3 << product
      end
    end
  end

  def view
    @product = Product.find_by(name: "Giant Rubber Rat")
  end

end
