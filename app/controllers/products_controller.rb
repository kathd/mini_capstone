class ProductsController < ApplicationController
  
  def all_method
    @products = Product.all
    render "all_products.html.erb"
  end

end
