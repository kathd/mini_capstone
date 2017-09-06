class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description])
    @product.save
    flash[:success] = "New Product Added"
    redirect_to "/products/#{@product.id}"
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
    product = Product.find_by(id: params[:id])
    product.update(
      id: params[:id],
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description])
    flash[:success] = "Product Updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:danger] = "Product Deleted"
    redirect_to "/products"
  end

end
