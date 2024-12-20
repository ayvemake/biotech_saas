class Test < ApplicationRecord
  belongs_to :diagnostic_order
  belongs_to :sample

  validates :name, :status, presence: true

  enum status: { pending: "En attente", in_progress: "En cours", completed: "Terminé" }
end
