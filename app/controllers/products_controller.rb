class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @products = Product.all
    render json: @products
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: {status: :created, entity: @product}
    else
      render json: {errors: @product.errors, status: :unprocessable_entity} 
    end
  end

  def update
    if @product.update(product_params)
      render json: {status: :ok, entity: @product }
    else
      render json: {errors: @product.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @product.destroy
    render :json => {status: :ok}
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name_product, :precio_compra, :precio_venta, :stock_available)
    end
    
end
