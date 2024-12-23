module BloodSampleWorkflow
  class AnalysisComponent < BaseComponent
    def render?
      blood_sample.processes_completed?
    end

    def ready_for_analysis?
      blood_sample.cell_culture_process&.completed? && 
      blood_sample.protein_process&.completed?
    end

    def analysis_status
      if blood_sample.analysis.nil?
        "Not Started"
      else
        blood_sample.analysis.status.humanize
      end
    end
  end
end 