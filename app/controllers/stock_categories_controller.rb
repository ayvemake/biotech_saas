class StockCategoriesController < ApplicationController
  before_action :set_stock_category, only: [:show, :edit, :update, :destroy]

  def index
    @stock_categories = StockCategory.all
  end

  def show
  end

  def new
    @stock_category = StockCategory.new
  end

  def edit
  end

  def create
    @stock_category = StockCategory.new(stock_category_params)

    if @stock_category.save
      redirect_to @stock_category, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @stock_category.update(stock_category_params)
      redirect_to @stock_category, notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stock_category.destroy
    redirect_to stock_categories_url, notice: 'Category was successfully deleted.'
  end

  private

  def set_stock_category
    @stock_category = StockCategory.find(params[:id])
  end

  def stock_category_params
    params.require(:stock_category).permit(:name, :description)
  end
end 