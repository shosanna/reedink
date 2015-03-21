module BooksHelper
  def start_reading_link(book)
    link_to "start reading", book_reading_statuses_path(book), method: "POST"
  end

  def read_percentage(status_id, book, user)
    100 * user.read_pages(status_id) / book.page_count
  end

  def read_pages(status_id, user_id)
    current_user.read_pages(status_id)
  end
end
