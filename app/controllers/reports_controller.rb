class ReportsController < ApplicationController
  def generate_diagnostic_report
    @diagnostic_order = DiagnosticOrder.find(params[:id])
    @patient = @diagnostic_order.patient
    @tests = @diagnostic_order.tests

    respond_to do |format|
      format.html  # Vue HTML par défaut
      format.pdf do
        render pdf: "Diagnostic_Report_#{@patient.full_name}",
               template: "reports/diagnostic_report.pdf.erb",  # Chemin vers la vue PDF
               layout: "pdf.html",  # Layout pour le PDF
               encoding: "UTF-8"
      end
    end
  end
end
