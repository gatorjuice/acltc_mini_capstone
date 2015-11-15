class ProductsController < ApplicationController

  def new
    @product = Product.new(name: "", price: "", image: "", description: "")
  end

  def create
    @product = Product.create(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    redirect_to '/products'
    # File.open(Rails.root.join('app/assets', 'images', @product.image), 'wb') do |f|
    #   f.write(@product.image)
    # end
  end

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

  def show
    @product = Product.find_by(id: params[:id])
  end

  def form_result
    @message = params[:message]
    @product = Product.find_by(id: params[:message])
  end

end
