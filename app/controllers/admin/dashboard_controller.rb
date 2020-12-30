class Admin::DashboardController < AdminController
  before_action :set_active
  def index
  end
  def set_active
    @dashboard = "active"
  end
end
