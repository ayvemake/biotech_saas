class Patient < ApplicationRecord
  has_many :samples, dependent: :destroy

  validates :first_name, :last_name, :date_of_birth, presence: true

  # Définir les statuts possibles avec Active Record Enum
  # enum status: { en_attente: 0, under_process_1: 1, under_process_2: 2, analysed: 3, sent: 4 }

  # Validation du statut
  validates :status, presence: true
end
