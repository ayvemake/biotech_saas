module StockItemsHelper
  def quantity_status_color(item)
    if item.current_quantity <= 0
      'text-red-800 bg-red-100 px-2 py-1 rounded-full text-xs font-medium'
    elsif item.current_quantity <= item.minimum_quantity
      'text-yellow-800 bg-yellow-100 px-2 py-1 rounded-full text-xs font-medium'
    else
      'text-green-800 bg-green-100 px-2 py-1 rounded-full text-xs font-medium'
    end
  end
end 