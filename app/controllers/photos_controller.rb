class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @selection = []
    @products = Product.all
    @products.each do |product|
      @selection << "#{product.name}-#{product.id}"
    end
    @selection
  end

  def create
    Photo.create(url: params[:url], product_id: params[:product_id])
    redirect_to "/photos"
  end

  def edit
    @photo = Photo.find_by(id: params[:id])
  end

  def update
    Photo.update(url: params[:url], product_id: params[:product_id])
    redirect_to "/photos"
  end

  def destroy
    Photo.find_by(id: params[:id]).destroy
    redirect_to "/photos"
  end

end
