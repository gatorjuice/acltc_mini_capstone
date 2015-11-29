class OrdersController < ApplicationController
  SALES_TAX = 0.95
  def index
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def new
  end

  def create
    product = Product.find_by(id: params[:product_id])
    price = product.price
    quantity = params[:quantity].to_i
    subtotal = price * quantity
    tax = subtotal * 0.0095
    byebug
    order = Order.create(
      product_id: params[:product_id].to_i,
      user_id: current_user.id,
      quantity: quantity,
      subtotal: subtotal,
      tax: tax,
      total: tax + subtotal
      )
    redirect_to "/orders/#{order.id}"
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end


  # create_table "orders", force: :cascade do |t|
  #   t.integer  "user_id",    limit: 4
  #   t.integer  "product_id", limit: 4
  #   t.integer  "quantity",   limit: 4
  #   t.decimal  "subtotal",             precision: 8, scale: 2
  #   t.decimal  "tax",                  precision: 8, scale: 2
  #   t.decimal  "total",                precision: 8, scale: 2
  #   t.datetime "created_at",                                   null: false
  #   t.datetime "updated_at",