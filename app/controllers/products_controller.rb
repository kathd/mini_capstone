class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @new_product = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description])
    @new_product.save
    render "create.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      id: params[:id],
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description])
    render "update.html.erb"
  end

end
