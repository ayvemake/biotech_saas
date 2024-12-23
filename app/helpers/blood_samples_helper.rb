module BloodSamplesHelper
  def status_badge_class(status)
    base_classes = "px-2 py-1 rounded-full text-sm font-medium"
    
    status_classes = {
      received: "bg-blue-100 text-blue-800",
      processing: "bg-yellow-100 text-yellow-800",
      analysis_pending: "bg-purple-100 text-purple-800",
      analysis_complete: "bg-green-100 text-green-800",
      diagnosed: "bg-indigo-100 text-indigo-800",
      pending: "bg-gray-100 text-gray-800",
      in_progress: "bg-yellow-100 text-yellow-800",
      completed: "bg-green-100 text-green-800",
      failed: "bg-red-100 text-red-800"
    }

    "#{base_classes} #{status_classes[status.to_sym]}"
  end
end 