class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings, id: :uuid do |t|
      t.uuid :taggable_id,     null: false
      t.string :taggable_type, null: false
      t.uuid :tag_id,          null: false

      t.timestamps
    end
  end
end
