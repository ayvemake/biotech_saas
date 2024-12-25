class StockItem < ApplicationRecord
  belongs_to :stock_category
  belongs_to :product, optional: true
  has_many :stock_batches, dependent: :destroy
  
  validates :name, presence: true
  validates :reference, uniqueness: true, allow_blank: true
  validates :minimum_quantity, :current_quantity,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  def low_stock?
    current_quantity <= minimum_quantity
  end
  
  def out_of_stock?
    current_quantity <= 0
  end
  
  def status
    if out_of_stock?
      :out_of_stock
    elsif low_stock?
      :low_stock
    else
      :in_stock
    end
  end
end
