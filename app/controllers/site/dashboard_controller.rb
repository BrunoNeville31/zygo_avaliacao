class Site::DashboardController < SiteController
  def index;end

  def show
    @book_id = Book.find(params[:book])
  end
end
