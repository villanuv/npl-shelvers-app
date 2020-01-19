class CreateLibraryHours < ActiveRecord::Migration
  def change
    create_table :library_hours do |t|
      t.integer :week_number
      t.integer :year
      t.string :sun
      t.string :mon
      t.string :tue
      t.string :wed
      t.string :thu
      t.string :fri
      t.string :sat

      t.timestamps null: false
    end
  end
end
