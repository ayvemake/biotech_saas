class Analysis < ApplicationRecord
  belongs_to :patient
  belongs_to :blood_sample
  has_many :cell_culture_processes, dependent: :destroy
  has_many :protein_processes, dependent: :destroy

  validates :name, presence: true
  validates :status, presence: true

  enum status: {
    pending: 0,
    in_progress: 1,
    completed: 2,
    cancelled: 3
  }
end
