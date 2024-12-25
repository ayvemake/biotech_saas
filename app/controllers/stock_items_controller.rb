class StockItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stock_item, only: [:show, :edit, :update, :destroy]

  def index
    @stock_items = StockItem.includes(:stock_category, :product)
                          .order(created_at: :desc)
  end

  def show
    @stock_batches = @stock_item.stock_batches.order(expiry_date: :asc)
  end

  def new
    @stock_item = StockItem.new
  end

  def create
    @stock_item = StockItem.new(stock_item_params)
    if @stock_item.save
      redirect_to @stock_item, notice: 'Stock item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @stock_item.update(stock_item_params)
      redirect_to @stock_item, notice: 'Stock item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @stock_item.stock_batches.any?
      redirect_to @stock_item, alert: 'Cannot delete item with existing batches.'
    else
      @stock_item.destroy
      redirect_to stock_items_path, notice: 'Stock item was successfully deleted.'
    end
  end

  private

  def set_stock_item
    @stock_item = StockItem.find(params[:id])
  end

  def stock_item_params
    params.require(:stock_item).permit(
      :name, :reference, :stock_category_id, :product_id,
      :minimum_quantity, :current_quantity, :unit, :location
    )
  end
end 