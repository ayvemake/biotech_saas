class ProteinProcess < ApplicationRecord
  belongs_to :blood_sample

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

  after_update :check_analysis_readiness, if: :completed?

  private

  def check_analysis_readiness
    return unless blood_sample.ready_for_analysis?
    blood_sample.update(status: :analysis_pending)
  end
end 