class SuppliersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_supplier, only: [:show, :update, :destroy]

  def index
    @suppliers = Supplier.all
    render json: @suppliers
  end

  def show
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      render json: {status: :created, entity: @supplier}
    else
      render json: {errors: @supplier.errors, status: :unprocessable_entity} 
    end
  end

  def update
    if @supplier.update(product_params)
      render json: {status: :ok, entity: @supplier }
    else
      render json: {errors: @supplier.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @supplier.destroy
    render json: {status: :ok}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name_supplier)
    end
end
