class Product < ApplicationRecord
  has_many :stock_items
  
  validates :barcode, presence: true, uniqueness: true
  validates :name, presence: true
end
