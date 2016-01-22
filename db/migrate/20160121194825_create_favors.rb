class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
