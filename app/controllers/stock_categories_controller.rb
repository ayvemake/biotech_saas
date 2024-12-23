class StockCategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = StockCategory.all
  end

  def show
  end

  def new
    @category = StockCategory.new
  end

  def create
    @category = StockCategory.new(category_params)
    if @category.save
      redirect_to stock_categories_path, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to stock_categories_path, notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to stock_categories_path, notice: 'Category was successfully deleted.'
  end

  private

  def set_category
    @category = StockCategory.find(params[:id])
  end

  def category_params
    params.require(:stock_category).permit(:name, :description)
  end
end 