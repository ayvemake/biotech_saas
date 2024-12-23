class StockBatch < ApplicationRecord
  belongs_to :stock_item
  
  validates :number, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :received_date, presence: true
  validate :expiry_date_after_received_date
  
  private
  
  def expiry_date_after_received_date
    return unless received_date && expiry_date
    if expiry_date <= received_date
      errors.add(:expiry_date, "must be after received date")
    end
  end
end
