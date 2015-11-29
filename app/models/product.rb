class Product < ActiveRecord::Base
  has_many :photos
  belongs_to :supplier
  belongs_to :user
  has_many :orders

  def price_callout
    price < 2 ? "Deep Discount" : "On Sale"
  end

  def sales_tax
    price * 0.10
  end

  def total
    sales_tax + price
  end

end