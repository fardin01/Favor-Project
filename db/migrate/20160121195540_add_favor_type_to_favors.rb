class AddFavorTypeToFavors < ActiveRecord::Migration
  def change
    add_column :favors, :favor_type, :string
  end
end
