class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    if params[:sort] && params[:sort_order]
      @products = Product.all.order(params[:sort] => params[:sort_order])
    end

    if params[:discount]
      @products = Product.where("price <= ?", 2)
    end

    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    # supplier_id = params[:supplier]['supplier_id']

    @product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description]
      # supplier_id: supplier_id
      )
    flash[:success] = "New Product Added"
    redirect_to "/products/#{@product.id}"
  end

  def show
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
      @product = Product.find_by(id: params[:id])
    end
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
      description: params[:description],
      in_stock: params[:in_stock])
    flash[:success] = "Product Updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:danger] = "Product Deleted"
    redirect_to "/products"
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}")
    render "index.html.erb"
  end


end
