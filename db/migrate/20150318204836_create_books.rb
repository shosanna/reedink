class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, id: :uuid do |t|
      t.string :title,       null: false
      t.string :author,      null: false
      t.integer :page_count, null: false
      t.string :url

      t.timestamps
    end
  end
end
