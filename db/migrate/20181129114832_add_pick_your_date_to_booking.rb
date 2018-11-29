class AddPickYourDateToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :pick_your_date, :date
  end
end
