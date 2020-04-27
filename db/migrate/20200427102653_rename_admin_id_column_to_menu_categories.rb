class RenameAdminIdColumnToMenuCategories < ActiveRecord::Migration[5.2]
  def change
  	rename_column :menu_categories, :admin_id, :restaurant_id
  end
end
