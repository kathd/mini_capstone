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
    if current_user.admin
      render "new.html.erb"
    else
      flash[:warning] = "YOU ARE NOT AUTHORIZED"
      redirect_to "/products"
    end
  end

  def create
    supplier_id = params[:supplier_id]
    if current_user.admin
      @product = Product.create(
        name: params[:name],
        price: params[:price],
        description: params[:description],
        image: params[:image],
        supplier_id: supplier_id
        )
      flash[:success] = "New Product Added"
    else
      flash[:warning] = "YOU ARE NOT AUTHORIZED"
    end
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
    if current_user.admin
      @product = Product.find_by(id: params[:id])
      @image = Image.find_by(product_id: params[:product_id])
      render "edit.html.erb"
    else
      flash[:warning] = "YOU ARE NOT AUTHORIZED"
      redirect_to "/products/#{@product.id}"
    end
  end

  def update
    if current_user.admin
      product = Product.find_by(id: params[:id])
      product.update(
        id: params[:id],
        name: params[:name],
        price: params[:price],
        description: params[:description],
        in_stock: params[:in_stock])
      flash[:success] = "Product Updated"
    else
      flash[:warning] = "YOU ARE NOT AUTHORIZED"
    end
    redirect_to "/products/#{product.id}"
  end

  def destroy
    if current_user.admin
      @product = Product.find_by(id: params[:id])
      @product.destroy
      flash[:danger] = "Product Deleted"
    else
      flash[:warning] = "YOU ARE NOT AUTHORIZED"
    end
    redirect_to "/products/#{product.id}"
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}")
    render "index.html.erb"
  end


end
