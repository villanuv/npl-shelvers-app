class CreateShelvers < ActiveRecord::Migration
  def change
    create_table :shelvers do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.date :birthday
      t.date :last_day

      t.timestamps null: false
    end
  end
end
