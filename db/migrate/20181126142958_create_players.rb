class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :price_per_day
      t.boolean :availability
      t.string :position
      t.string :latitude
      t.string :longitude
      t.string :level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
