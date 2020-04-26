class AddAdminNameKanjiToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :admin_name_kanji, :string
  end
end
