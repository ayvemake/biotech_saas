module BloodSampleWorkflow
  class ParallelProcessesComponent < BaseComponent
    def render?
      blood_sample.in_process?
    end

    def cell_culture_status
      blood_sample.cell_culture_process&.status || "not_started"
    end

    def protein_analysis_status
      blood_sample.protein_process&.status || "not_started"
    end
  end
end 