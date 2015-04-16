class MakeBooksUserIdNotNull < ActiveRecord::Migration
  def change
    change_column :books, :user_id, :uuid, null: false
  end
end
