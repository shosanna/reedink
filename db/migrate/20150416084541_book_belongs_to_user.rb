class BookBelongsToUser < ActiveRecord::Migration
  def change
    add_column :books, :user_id, :uuid

    admin = User.where(email: "darthdeus@gmail.com").first || User.first

    Book.update_all(user_id: admin.id)
  end
end
