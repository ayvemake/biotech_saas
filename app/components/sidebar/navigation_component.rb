module Sidebar
  class NavigationComponent < ViewComponent::Base
    include Rails.application.routes.url_helpers
    
    def initialize
      @expanded = false
    end

    def quick_access_items
      [
        {
          icon: "fa-user-group",
          title: "Patients",
          path: root_path,
          color: "bg-blue-500",
          subitems: [
            { title: "All Patients", path: root_path },
            { title: "Add Patient", path: root_path }
          ]
        },
        {
          icon: "fa-microscope",
          title: "Analyses",
          path: root_path,
          color: "bg-purple-500",
          subitems: [
            { title: "All Analyses", path: root_path },
            { title: "New Analysis", path: root_path }
          ]
        },
        {
          icon: "fa-boxes-stacked",
          title: "Stocks",
          path: stock_items_path,
          color: "bg-green-500",
          subitems: [
            { title: "Stock Items", path: stock_items_path },
            { title: "Categories", path: stock_categories_path },
            { title: "Add Item", path: new_stock_item_path }
          ]
        },
        {
          icon: "fa-folder",
          title: "Documents",
          path: root_path,
          color: "bg-yellow-500",
          subitems: [
            { title: "All Documents", path: root_path },
            { title: "Upload Document", path: root_path }
          ]
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