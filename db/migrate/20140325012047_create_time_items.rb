class CreateTimeItems < ActiveRecord::Migration
  def change
    create_table :time_items do |t|
      t.references :timeday, index: true
      t.references :user, index: true
      t.integer :time
      t.string :description
      t.string :category
      t.string :cost_centre

      t.timestamps
    end
  end
end
