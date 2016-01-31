class AddDefaultFalse < ActiveRecord::Migration
  def change
    change_column :favors, :completed, :boolean, :default => false
    change_column :acceptances, :accepted, :boolean, :default => false
  end
end
