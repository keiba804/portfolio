class AddAdminIdToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :admin_id, :integer
  end
end
