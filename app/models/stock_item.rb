class StockItem < ApplicationRecord
  belongs_to :stock_category
  has_many :stock_batches, dependent: :destroy
  
  validates :name, presence: true
  validates :reference, presence: true, uniqueness: true
  validates :minimum_quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :current_quantity, numericality: { greater_than_or_equal_to: 0 }
  
  def low_stock?
    current_quantity <= minimum_quantity
  end
  
  def expiring_soon?
    return false unless expiry_date
    expiry_date < 30.days.from_now
  end
end
