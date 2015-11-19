class ProductsController < ApplicationController

  def new
  end

  def create
    @product = Product.create(name: params[:name], price: params[:price], image: params[:image], description: params[:description], quantity: params[:quantity])
    flash[:message] = "Product was Added."
    redirect_to '/products'
    # File.open(Rails.root.join('app/assets', 'images', @product.image), 'wb') do |f|
    #   f.write(@product.image)
    # end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(name: params[:name], price: params[:price], image: params[:image], description: params[:description], quantity: params[:quantity])
    flash[:info] = "Product was updated"
    redirect_to "/products/#{@product.id}"
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
    @message = params[:success]
    @product = Product.find_by(id: params[:success])
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product was deleted."
    redirect_to "/products"
  end

end
