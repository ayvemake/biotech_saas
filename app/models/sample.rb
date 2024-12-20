class Sample < ApplicationRecord
  belongs_to :patient

  enum status: { received: 0, prepared: 1, analyzed: 2, archived: 3 }

  validates :barcode, presence: true, uniqueness: true
end
