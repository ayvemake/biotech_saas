class ApplicationController < ActionController::Base
  helper_method :show_stock_submenu?

  private

  def show_stock_submenu?
    controller_name.start_with?('stock')
  end
end 