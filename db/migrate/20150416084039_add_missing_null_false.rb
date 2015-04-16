class AddMissingNullFalse < ActiveRecord::Migration
  def change
    change_column :reading_statuses, :book_id, :uuid, null: false
    change_column :reading_statuses, :user_id, :uuid, null: false

    change_column :reports, :skill_id, :uuid, null: false

    change_column :skills, :user_id, :uuid, null: false
    change_column :skills, :name, :string, null: false
  end
end
