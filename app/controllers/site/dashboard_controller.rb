class Site::DashboardController < SiteController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:book])
  end

  def order
    @books = Book.order(title: params[:order].to_sym)  
  end
end
