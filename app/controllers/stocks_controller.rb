class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
    @stocks = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create
    # Debug logs
    Rails.logger.debug "Creating new stock with params: #{stock_params.inspect}"
    
    @stock = Stock.new
    @stock.name = stock_params[:name]
    @stock.category = stock_params[:category]
    @stock.quantity = stock_params[:quantity]
    @stock.minimum_quantity = stock_params[:minimum_quantity]
    @stock.expiry_date = stock_params[:expiry_date]

    Rails.logger.debug "Stock object before save: #{@stock.attributes.inspect}"

    respond_to do |format|
      if @stock.save
        Rails.logger.debug "Stock saved successfully: #{@stock.attributes.inspect}"
        format.html { redirect_to stocks_path, notice: 'Stock was successfully created.' }
      else
        Rails.logger.error "Stock save failed: #{@stock.errors.full_messages}"
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    Rails.logger.debug "Updating stock with params: #{stock_params.inspect}"
    
    respond_to do |format|
      if @stock.update(stock_params)
        Rails.logger.debug "Stock updated successfully: #{@stock.attributes.inspect}"
        format.html { redirect_to stocks_path, notice: 'Stock was successfully updated.' }
      else
        Rails.logger.error "Stock update failed: #{@stock.errors.full_messages}"
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_path, notice: 'Stock was successfully deleted.' }
    end
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    permitted_params = params.require(:stock).permit(:name, :category, :quantity, :minimum_quantity, :expiry_date)
    Rails.logger.debug "Permitted params: #{permitted_params.inspect}"
    permitted_params
  end
end 