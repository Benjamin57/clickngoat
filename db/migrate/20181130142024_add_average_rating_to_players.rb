class AddAverageRatingToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :average_rating, :float
  end
end
