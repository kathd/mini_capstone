class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products

  # def subtotal
  #   Product.price * @order.quantity
  # end

  # def tax
  #   subtotal * 0.09
  # end

  # def total
  #   subtotal + tax
  # end

end
