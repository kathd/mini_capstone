class OrdersController < ApplicationController

  def new
    render :new
  end

  def create
    product_id = params[:product_id]
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    product = Product.find(product_id)
    order.subtotal = product.price * quantity
    order.tax = order.subtotal * 0.09
    order.total = order.subtotal + tax
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

end
