module Admin::BookshelfHelper

    def author(id)
        book = Book.find(id)
        book.author || "Autor não identificado"
    end   
end
