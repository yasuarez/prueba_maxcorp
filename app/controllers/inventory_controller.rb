class InventoryController < ApplicationController
  before_action :authenticate_user!
  before_action :get_inventory, only: [:show, :update, :destroy]
  def index
    @inventoryAll = InventoryMovement.all.as_json(:include => [:inventory_entries , :inventory_outputs ])
    render json: @inventoryAll
  end

  def show
    @inventory = @inventory.as_json(:include => [:inventory_entries , :inventory_outputs ])
    render json: @inventory
  end

  def create
    msg = {}
    @inventory = InventoryMovement.new(inventory_params)
    if @inventory.save
      msg[:status] = :created
      if @inventory.type_movement == 'entrada'
        paramsEntry = inventory_entries_params
        paramsEntry[:inventory_movement_id] = @inventory.id
        entry = InventoryEntry.new(paramsEntry)
        unless entry.save
          msg[:entry] = entry.errors
        end
      elsif @inventory.type_movement == 'salida'
        paramsOut = inventory_outputs_params
        paramsOut[:inventory_movement_id] = @inventory.id
        output = InventoryOutput.new(paramsOut)
        unless output.save
          msg[:output] = output.errors
        end
      end
      msg[:entity] = @inventory.as_json(:include => [:inventory_entries , :inventory_outputs ])
      render json: msg
    else
      render json: {errors: @inventory.errors, status: :unprocessable_entity} 
    end
  end

  def update
    if @inventory.update(inventory_params)
      if @inventory.type_movement == 'entrada'
        unless @inventory.inventory_entries.nil?
          @inventory.inventory_entries[0].update(inventory_entries_params)
        else
          @inventory.inventory_entries[0].destroy
          paramsEntry = inventory_entries_params
          paramsEntry[:inventory_movement_id] = @inventory.id
          InventoryEntry.create(paramsEntry)
        end
      elsif @inventory.type_movement == 'salida'
        unless @inventory.inventory_outputs.nil?
          @inventory.inventory_outputs[0].update(inventory_outputs_params)
        else
          @inventory.inventory_outputs[0].destroy
          paramsOut = inventory_outputs_params
          paramsOut[:inventory_movement_id] = @inventory.id
          InventoryOutput.create(paramsOut)
        end
      end
      render json: {status: :updated, entity:  @inventory.as_json(:include => [:inventory_entries , :inventory_outputs ]) }
    else
      render json: {errors: @product.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @inventory.destroy
    render json: {status: :ok }
  end
  
  private
    def get_inventory
      @inventory = InventoryMovement.find(params[:id])
    end

    def inventory_params
      params.require(:inventory).permit(:type_movement,:product_id)
    end
    
    def inventory_entries_params
      params.require(:inventory).permit(:quantity,:supplier_id)
    end
    
    def inventory_outputs_params
      params.require(:inventory).permit(:quantity)
    end
    
end
