require 'rails_helper'
require_relative '../../support/devise'

RSpec.describe Admin::BookshelfController, type: :controller do
    describe "All methods controller" do       
        login_admin

        let(:description) { Book.first.description }
        let(:title) { Book.first.title }
        let(:name_book) { Book.first.name }
        let(:author) { Book.first.author }

        describe 'GET /admin/books' do
            context "Show all books" do 
                it "return success" do       
                    get :index               
                    expect(response).to have_http_status(:success)
                end
            end           
        end
        describe 'POST /admin/books/new' do            

            context "Included new book" do 
                it "return success" do  

                    post :create, params: { book: { name: 'Nome do Livro', title: 'Título', author: 'Autor do Livro', description: 'teste'} }

                    expect(description).to eq("teste")
                    expect(title).to eq("Título")
                    expect(name_book).to eq("Nome do Livro")
                    expect(author).to eq("Autor do Livro")
                end
            end
        end

        describe 'PATCH /admin/book/edit' do 

            let(:description_edit) { "Descricao Livro" }
            let(:title_edit) { "Título Livro" }
            let(:name_book_edit) { "Nome Livro" }
            let(:author_edit) { "Autor Livro" }

            let!(:book) { create(:book) }

            context "Updated book" do 
                it "Updated success" do 
                    patch :update, params: { book: { name: name_book_edit, title: title_edit, author: author_edit, description: description_edit}, id: book.id }

                    expect(author).to eq(author_edit)
                end
            end
        end

        describe 'DELETE /admin/book/edit' do 

            let!(:book) { create(:book) }

            context "Delete book" do 
                it "return success" do 
                    delete :destroy, params: { id: book.id }
                   
                    expect(Book.count).to eq(0)
                end
            end
        end


    end
end
