class ChangeDataTakeoutToMenus < ActiveRecord::Migration[5.2]
  def change
  	change_column :menus, :takeout, :integer
  end
end
