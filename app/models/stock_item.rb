class StockItem < ApplicationRecord
  belongs_to :stock_category
  belongs_to :product, optional: true
  has_many :stock_batches, dependent: :destroy
  
  validates :name, presence: true
  validates :current_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :minimum_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :barcode, uniqueness: true, allow_blank: true
  validates :reference, uniqueness: true, allow_blank: true
  
  def low_stock?
    current_quantity <= minimum_quantity
  end
  
  def expiring_soon?
    return false unless expiry_date
    expiry_date < 30.days.from_now
  end
end
