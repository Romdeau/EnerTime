class CreateTimeDays < ActiveRecord::Migration
  def change
    create_table :time_days do |t|
      t.date :time_day
      t.references :time_sheet, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
