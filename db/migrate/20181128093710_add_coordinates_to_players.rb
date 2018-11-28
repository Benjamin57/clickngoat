class AddCoordinatesToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :latitude, :float
    add_column :players, :longitude, :float
  end
end
