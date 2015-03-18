class CreateReadingStatuses < ActiveRecord::Migration
  def change
    create_table :reading_statuses, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :book_id

      t.timestamps

    end
  end
end
