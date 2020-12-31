module ApplicationHelper
    def has_book_face(id)
        book = Book.find(id)
        book.book_face.attached? ? book.book_face : ''
    end
end
