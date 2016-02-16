class CreateCompensations < ActiveRecord::Migration
  def change
    create_table :compensations do |t|
      t.integer :favor_id
      t.integer :reward_id

      t.timestamps null: false
    end
  end
end
