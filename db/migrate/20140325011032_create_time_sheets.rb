class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.references :user, index: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
