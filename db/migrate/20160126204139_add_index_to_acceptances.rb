class AddIndexToAcceptances < ActiveRecord::Migration
  def change
    add_index :acceptances, [:user_id, :favor_id], unique: true
  end
end
