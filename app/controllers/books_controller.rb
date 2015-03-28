class BooksController < AuthenticatedController
  def index
    join_params = Book.arel_table.join(ReadingStatus.arel_table, Arel::OuterJoin)
                                 .on(Book[:id].eq(ReadingStatus[:book_id])
                                 .and(ReadingStatus[:user_id].eq(current_user.id)))
                                 .join_sources
    @books = Book.select("books.*, reading_statuses.user_id, reading_statuses.id as status_id")
                 .includes(:tags)
                 .joins(join_params)
                 .order("reading_statuses.user_id")
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])

    @status = current_user.status_for(@book)
    if @status
      @dataset = @status.progresses.map { |p| [p.page_from, p.page_to] }
      @progress = @status.progresses.build(page_from: @status.furthest_read)
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      @book.tag_names = params[:book][:tag_names]
      flash[:success] = "Book was created."
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book was updated."
      redirect_to @book
    else
      render :edit
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
