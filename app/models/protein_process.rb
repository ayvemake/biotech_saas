class ProteinProcess < ApplicationRecord
  belongs_to :analysis
  belongs_to :blood_sample

  validates :concentration, numericality: { greater_than: 0 }, allow_nil: true
  validates :purity, numericality: { 
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }, allow_nil: true
end 