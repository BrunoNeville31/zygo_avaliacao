class Admin::BookshelfController < AdminController
  before_action :set_active
  before_action :set_book, only: [:edit, :update, :destroy]
  
  def index
    @books = Book.all
  end  

  def new
    @book = Book.new
  end

  def create    
    @book = Book.new(set_params)
    respond_to do |format|
      if @book.save!        
        format.html{redirect_to admin_bookshelf_index_path, notice: 'Livro adicionado com Sucesso.'}
      else
        format.html{render :new, notice: 'Erro ao adicionado Livro.'}
      end
    end
     
  end

  def edit;end

  def update
    respond_to do |format|
      if @book.update!(set_params)       
        format.html{redirect_to admin_bookshelf_index_path, notice: 'Livro atualizado com Sucesso.'}
      else
        format.html{render :new, notice: 'Erro ao atualizar Livro.'}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @book.destroy!
        format.html{redirect_to admin_bookshelf_index_path, notice: 'Livro deletado com Sucesso.'}
      else
        format.html{render :new, notice: 'Erro ao deletar Livro.'}
      end
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_params
    params.require(:book).permit(:name, :author, :title, :description, :book_face)
  end

  def set_active
    @bookshelf = "active"
  end
end
