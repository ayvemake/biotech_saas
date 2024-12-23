module BloodSampleWorkflow
  class DiagnosisComponent < BaseComponent
    def render?
      blood_sample.analysis_completed?
    end

    def diagnosis_status
      if blood_sample.diagnosis.nil?
        "Pending"
      else
        blood_sample.diagnosis.status.humanize
      end
    end
  end
end 