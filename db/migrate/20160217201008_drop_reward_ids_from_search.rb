class DropRewardIdsFromSearch < ActiveRecord::Migration
  def change
    remove_column :searches, :reward_ids
  end
end
