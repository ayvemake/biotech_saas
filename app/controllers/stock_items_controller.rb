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

  def create
    @stock_item = StockItem.new(stock_item_params)
    if @stock_item.save
      redirect_to stock_items_path, notice: 'Stock item was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @stock_item.update(stock_item_params)
      redirect_to stock_items_path, notice: 'Stock item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @stock_item.destroy
    redirect_to stock_items_path, notice: 'Stock item was successfully deleted.'
  end

  private

  def set_stock_item
    @stock_item = StockItem.find(params[:id])
  end

  def stock_item_params
    params.require(:stock_item).permit(:name, :description, :quantity, :minimum_quantity, :stock_category_id)
  end
end 