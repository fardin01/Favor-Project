class EditSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :type
    add_column :searches, :requested, :boolean, default: false
    add_column :searches, :offered, :boolean, default: false
  end
end
