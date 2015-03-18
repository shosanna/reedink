class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.uuid :reading_status_id, null: false
      t.integer :page_from,      null: false
      t.integer :page_to,        null: false

      t.timestamps
    end
  end
end
