class BooksController < AuthenticatedController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was created."
      redirect_to books_path
    else
      render :new
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book was deleted."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :page_count, :url)
  end
end