class AddCityToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :city, :string
  end
end
