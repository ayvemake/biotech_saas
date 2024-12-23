class StockBatchesController < ApplicationController
  before_action :set_stock_batch, only: [:show, :edit, :update, :destroy]
  before_action :set_stock_item, only: [:new, :create]

  def index
    @stock_batches = StockBatch.includes(:stock_item).all
  end

  def show
  end

  def new
    @stock_batch = @stock_item.stock_batches.build
  end

  def edit
  end

  def create
    @stock_batch = @stock_item.stock_batches.build(stock_batch_params)

    if @stock_batch.save
      # Update total quantity of the item
      new_total = @stock_item.current_quantity + @stock_batch.quantity
      @stock_item.update(current_quantity: new_total)
      
      redirect_to @stock_item, notice: 'Batch was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @stock_batch.update(stock_batch_params)
      redirect_to @stock_batch.stock_item, notice: 'Batch was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    stock_item = @stock_batch.stock_item
    # Update total quantity of the item
    new_total = stock_item.current_quantity - @stock_batch.quantity
    stock_item.update(current_quantity: new_total)
    
    @stock_batch.destroy
    redirect_to stock_item, notice: 'Batch was successfully deleted.'
  end

  private

  def set_stock_batch
    @stock_batch = StockBatch.find(params[:id])
  end

  def set_stock_item
    @stock_item = StockItem.find(params[:stock_item_id])
  end

  def stock_batch_params
    params.require(:stock_batch).permit(:number, :quantity, :received_date, :expiry_date)
  end
end 