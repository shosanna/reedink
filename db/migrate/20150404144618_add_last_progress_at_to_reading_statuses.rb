class AddLastProgressAtToReadingStatuses < ActiveRecord::Migration
  def change
    transaction do
      add_column :reading_statuses, :last_progress_at, :datetime

      Progress.find_each do |progress|
        status = progress.reading_status
        last = [status.last_progress_at, progress.created_at].compact.max

        table = Arel::Table.new(:reading_statuses)
        manager = Arel::UpdateManager.new(table.engine)
        manager.table(table)
        manager.set [[table[:last_progress_at], last]]
        manager.where(table[:id].eq(progress.reading_status_id))

        execute manager.to_sql
      end

      ReadingStatus.where(last_progress_at: nil).update_all(last_progress_at: Time.zone.now)
      change_column :reading_statuses, :last_progress_at, :datetime, null: false
    end
  end
end
