class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :week_number
      t.integer :year
      t.string :sun
      t.string :mon
      t.string :tue
      t.string :wed
      t.string :thu
      t.string :fri
      t.string :sat
      t.references :shelver, index: true, foreign_key: true
      t.references :clerk, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
