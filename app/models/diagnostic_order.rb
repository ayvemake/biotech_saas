class DiagnosticOrder < ApplicationRecord
  belongs_to :patient
  has_many :tests, dependent: :destroy

  validates :doctor_name, :prescribed_at, presence: true
end
