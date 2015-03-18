class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports, id: :uuid do |t|
      t.uuid :skill_id
      t.string :title
      t.text :note

      t.timestamps
    end
  end
end
