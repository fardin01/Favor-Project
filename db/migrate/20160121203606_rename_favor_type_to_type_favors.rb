class RenameFavorTypeToTypeFavors < ActiveRecord::Migration
  def change
    rename_column :favors, :favor_type, :type
  end
end
