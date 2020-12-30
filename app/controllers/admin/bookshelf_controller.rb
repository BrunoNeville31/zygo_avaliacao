class Admin::BookshelfController < AdminController
  before_action :set_active
  
  def index
  end

  def new
  end

  def edit
  end

  def set_active
    @bookshelf = "active"
  end
end
