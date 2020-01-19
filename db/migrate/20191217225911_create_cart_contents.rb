class CreateCartContents < ActiveRecord::Migration
  def change
    create_table :cart_contents do |t|
      t.string :book_collection
      t.string :status
      t.datetime :check_in_start
      t.datetime :check_in_end
      t.string :sorted_by
      t.datetime :sorted_date
      t.datetime :shelving_start
      t.string :shelving_start_page
      t.datetime :shelving_end
      t.string :shelving_end_page
      t.references :cart, index: true, foreign_key: true
      t.references :shelver_starter, references: :shelvers
      t.references :shelver_finisher, references: :shelvers
      t.references :clerk_starter, references: :clerks
      t.references :clerk_finisher, references: :clerks

      t.timestamps null: false
    end
  end
end
