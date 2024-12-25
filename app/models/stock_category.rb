class StockCategory < ApplicationRecord
  has_many :stock_items, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  
  def to_s
    name
  end
end
