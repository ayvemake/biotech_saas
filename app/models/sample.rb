class Sample < ApplicationRecord
  belongs_to :patient

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :status, presence: true
end
