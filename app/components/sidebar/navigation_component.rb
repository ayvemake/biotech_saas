module Sidebar
  class NavigationComponent < ViewComponent::Base
    include Rails.application.routes.url_helpers
    
    def quick_access_items
      [
        {
          icon: "fa-user-group",
          title: "Patients",
          path: root_path,
          color: "bg-blue-500"
        },
        {
          icon: "fa-microscope",
          title: "Analyses",
          path: root_path,
          color: "bg-purple-500"
        },
        {
          icon: "fa-boxes-stacked",
          title: "Stocks",
          path: stock_items_path,
          color: "bg-green-500"
        },
        {
          icon: "fa-folder",
          title: "Documents",
          path: root_path,
          color: "bg-yellow-500"
        }
      ]
    end

    def navigation_items
      [
        {
          icon: "fa-flask",
          title: "Blood Samples",
          path: root_path,
          active: current_page?(root_path)
        },
        {
          icon: "fa-boxes",
          title: "Stocks",
          path: stock_items_path,
          active: current_page?(stock_items_path)
        }
      ]
    end

    private

    def current_page?(path)
      current_page = request.path
      path == current_page
    end
  end
end 