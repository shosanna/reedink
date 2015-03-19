class BooksController < AuthenticatedController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @progress = current_user.status_for(@book).progresses.build

    @dataset = current_user.status_for(@book).progresses.map { |p| [p.page_from, p.page_to] }
    @pages = @book.page_count
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
