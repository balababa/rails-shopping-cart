class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new()
  end

  def create
    product = Product.new(product_params)

    if product.save
      redirect_to products_path, notice: "商品新增成功"
    else
      render :new
    end
  end

  def edit
    find_product
  end

  def destroy
    find_product
    @product.destroy if @product
    redirect_to products_path, notice: "商品刪除成功"
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
end
