class Analysis < ApplicationRecord
  belongs_to :blood_sample
  has_one :diagnosis

  attribute :status, :integer, default: 0
  
  def self.statuses
    {
      pending: 0,
      in_progress: 1,
      completed: 2,
      failed: 3
    }
  end

  def status=(value)
    super(self.class.statuses[value.to_sym] || value)
  end

  def status
    self.class.statuses.key(super)
  end

  def completed?
    status == :completed
  end

  after_update :update_blood_sample_status, if: :completed?

  private

  def update_blood_sample_status
    blood_sample.update(status: :analysis_complete)
  end
end
