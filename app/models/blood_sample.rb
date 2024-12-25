class BloodSample < ApplicationRecord
    belongs_to :patient
    has_one :cell_culture_process
    has_one :protein_process
    has_many :analyses
    has_many :diagnoses
  
    enum status: {
      received: 0,
      processing: 1,
      completed: 2,
      failed: 3
    }
  
    def ready_for_analysis?
      cell_culture_process&.completed? && protein_process&.completed?
    end
  end
  