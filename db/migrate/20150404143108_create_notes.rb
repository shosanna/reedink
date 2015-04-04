class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes, id: :uuid do |t|
      t.text :text, null: false
      t.uuid :reading_status_id, null: false

      t.timestamps
    end
  end
end
