class CreateRewardsSearches < ActiveRecord::Migration
  def change
    create_table :rewards_searches do |t|
      t.integer :reward_id
      t.integer :search_id

      t.timestamps null: false
    end
  end
end
