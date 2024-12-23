module BloodSampleWorkflow
  class StatusComponent < BaseComponent
    def status_steps
      [
        { title: "Sample Reception", completed: blood_sample.received? },
        { title: "Cell Culture", completed: cell_culture_completed? },
        { title: "Protein Analysis", completed: protein_analysis_completed? },
        { title: "Final Analysis", completed: blood_sample.analysis_completed? },
        { title: "Diagnosis", completed: blood_sample.diagnosed? }
      ]
    end

    private

    def cell_culture_completed?
      blood_sample.cell_culture_process&.completed?
    end

    def protein_analysis_completed?
      blood_sample.protein_process&.completed?
    end
  end
end 