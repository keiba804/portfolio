class ChangeDataSalesStatusToMenus < ActiveRecord::Migration[5.2]
  def change
  	change_column :menus, :sales_status, :integer
  end
end
