class Product < ApplicationRecord
  has_many :stock_items
  validates :name, presence: true
end
