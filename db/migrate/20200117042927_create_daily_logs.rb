class CreateDailyLogs < ActiveRecord::Migration
  def change
    create_table :daily_logs do |t|
      t.boolean :email
      t.boolean :shelf_reading
      t.string :department
      t.string :daily_tasks
      t.string :cleanup
      t.boolean :cleanup_early
      t.boolean :cleanup_done
      t.integer :carts_sorted
      t.integer :year
      t.integer :week_number
      t.integer :day_number
      t.references :shelver, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
