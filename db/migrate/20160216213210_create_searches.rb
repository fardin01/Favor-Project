class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :type
      t.integer :reward_ids

      t.timestamps null: false
    end
  end
end
