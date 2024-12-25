class CellCultureProcess < ApplicationRecord
  belongs_to :analysis
  belongs_to :blood_sample

  validates :start_date, presence: true
  validates :cell_count, numericality: { greater_than: 0 }, allow_nil: true
  validates :viability, numericality: { 
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }, allow_nil: true

  def duration_in_days
    return nil unless start_date && end_date
    (end_date - start_date).to_i
  end
end 