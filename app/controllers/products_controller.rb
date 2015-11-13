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
    @product = Product.find_by(id: params[:id])
  end

  def form_result
    @message = params[:message]
    @product = Product.find_by(id: params[:message])
  end

end
