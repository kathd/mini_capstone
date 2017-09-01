class ProductsController < ApplicationController
  
  def all_method
    @products = Product.all
    render "all_products.html.erb"
  end

  def form
    render "form.html.erb"
  end

  def form_results
    @new_product = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description])
    @new_product.save
    render "form_results.html.erb"
  end

end
