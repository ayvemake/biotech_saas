class StockItemsController < ApplicationController
  before_action :set_stock_item, only: [:show, :edit, :update, :destroy, :update_quantity]
  before_action :set_stock_category, only: [:new, :create]

  def index
    @stock_items = StockItem.includes(:stock_category).all
  end

  def show
    @stock_batches = @stock_item.stock_batches.order(received_date: :desc)
  end

  def new
    @stock_item = @stock_category.stock_items.build
  end

  def edit
  end

  def create
    @stock_item = @stock_category.stock_items.build(stock_item_params)

    if @stock_item.save
      redirect_to @stock_item, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @stock_item.update(stock_item_params)
      redirect_to @stock_item, notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stock_item.destroy
    redirect_to stock_category_url(@stock_item.stock_category), notice: 'Item was successfully deleted.'
  end

  def update_quantity
    new_quantity = params[:stock_item][:current_quantity].to_i
    if @stock_item.update(current_quantity: new_quantity)
      redirect_to @stock_item, notice: 'Quantity was successfully updated.'
    else
      redirect_to @stock_item, alert: 'Error updating quantity.'
    end
  end

  private

  def set_stock_item
    @stock_item = StockItem.find(params[:id])
  end

  def set_stock_category
    @stock_category = StockCategory.find(params[:stock_category_id])
  end

  def stock_item_params
    params.require(:stock_item).permit(:name, :reference, :minimum_quantity, 
                                     :current_quantity, :unit, :location, :expiry_date)
  end
end 