class SidebarNavigationComponent < ViewComponent::Base
  include Rails.application.routes.url_helpers
  
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
        path: stocks_path,
        active: current_page?(stocks_path)
      }
    ]
  end

  private

  def current_page?(path)
    current_page = request.path
    path == current_page
  end
end 