class StockBatch < ApplicationRecord
  belongs_to :stock_item
  
  validates :number, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :received_date, presence: true
  validate :expiry_date_after_received_date
  
  before_create :update_stock_item_quantity
  before_destroy :reduce_stock_item_quantity
  
  private
  
  def expiry_date_after_received_date
    return unless received_date && expiry_date
    if expiry_date < received_date
      errors.add(:expiry_date, "must be after received date")
    end
  end
  
  def update_stock_item_quantity
    stock_item.increment!(:current_quantity, quantity)
  end
  
  def reduce_stock_item_quantity
    stock_item.decrement!(:current_quantity, quantity)
  end
end
