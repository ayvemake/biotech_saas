class StockCategory < ApplicationRecord
  has_many :stock_items, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
