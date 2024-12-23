module BloodSampleWorkflow
  class BaseComponent < ViewComponent::Base
    def initialize(blood_sample:)
      @blood_sample = blood_sample
    end

    private

    attr_reader :blood_sample
  end
end 