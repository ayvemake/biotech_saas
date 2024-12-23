class StockItemsController < ApplicationController
  before_action :set_stock_item, only: [:show, :edit, :update, :destroy]

  def index
    @stock_items = StockItem.all
  end

  def show
  end

  def new
    @stock_item = StockItem.new
  end

  def edit
  end

  def create
    @stock_item = StockItem.new(stock_item_params)
    
    begin
      # Créer ou trouver le produit seulement si on a un nom et une référence
      if @stock_item.name.present? && @stock_item.reference.present?
        product = Product.find_or_create_by!(
          name: @stock_item.name,
          reference_number: @stock_item.reference,
          barcode: generate_barcode(@stock_item.reference)
        )
        @stock_item.product = product
      end

      if @stock_item.save
        redirect_to stock_items_path, notice: 'Stock item was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid => e
      @stock_item.errors.add(:base, e.message)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @stock_item.update(stock_item_params)
      redirect_to stock_items_path, notice: 'Stock item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stock_item.destroy
    redirect_to stock_items_path, notice: 'Stock item was successfully deleted.'
  end

  def scan
    @product = Product.find_by(barcode: params[:barcode])
    
    respond_to do |format|
      format.json do
        if @product
          render json: {
            success: true,
            product: {
              name: @product.name,
              reference: @product.reference_number,
              # ... autres infos ...
            }
          }
        else
          render json: {
            success: false,
            message: "Product not found"
          }
        end
      end
    end
  end

  private

  def set_stock_item
    @stock_item = StockItem.find(params[:id])
  end

  def stock_item_params
    params.require(:stock_item).permit(
      :name, 
      :reference, 
      :product_id, 
      :stock_category_id, 
      :minimum_quantity, 
      :current_quantity, 
      :unit, 
      :location, 
      :expiry_date,
      :barcode
    )
  end

  def generate_barcode(reference)
    return nil if reference.blank?
    timestamp = Time.current.strftime('%y%m%d%H%M')
    clean_ref = reference.gsub(/[^0-9A-Z]/i, '')
    "#{clean_ref}-#{timestamp}"
  end
end 