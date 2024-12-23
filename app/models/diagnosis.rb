class Diagnosis < ApplicationRecord
  belongs_to :patient
  belongs_to :blood_sample, optional: true
  belongs_to :analysis, optional: true

  after_create :update_blood_sample_status, if: :blood_sample

  private

  def update_blood_sample_status
    blood_sample.update(status: :diagnosed)
  end
end
