module BooksHelper
  def start_reading_link(book)
    link_to "start reading", book_reading_statuses_path(book), method: "POST"
  end
end
