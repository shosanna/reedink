class ReadingStatusesController < AuthenticatedController
  def create
    book = Book.find(params[:book_id])
    current_user.reading_statuses.create!(book: book)

    flash[:success] = "You are now reading #{book.title}."
    redirect_to book
  end
end
