class CreateAcceptances < ActiveRecord::Migration
  def change
    create_table :acceptances do |t|
      t.integer :favor_id
      t.integer :user_id
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
