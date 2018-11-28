class ModifyColumnsInPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :latitude
    remove_column :players, :longitude
  end
end
