class SiteController < ApplicationController
    layout 'site'
    before_action :set_book
    
    def set_book
        @books = Book.all
    end
end
