class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @players = Player.joins(:reviews).where('reviews.rating > 3').group(:id).take(6)
  end

  def dashboard
    @players = current_user.players
    @bookings = current_user.bookings
    @all_bookings = Booking.all
    @bookings_as_owner = current_user.bookings_as_owner
    @bookings_as_renter = current_user.bookings
    @current_user_bookings
  end

  def players
    @gks = Player.where(position: 'Goal-keeper').joins(:reviews).where('reviews.rating > 3').group(:id).take(1)
    @backs = Player.where(position: 'Center-back').joins(:reviews).where('reviews.rating > 3').group(:id).take(4)
    @midfielders = Player.where(position: 'Midfielder').joins(:reviews).where('reviews.rating > 3').group(:id).take(3)
    @forwards = Player.where(position: 'Forward').joins(:reviews).where('reviews.rating > 3').group(:id).take(3)
  end
end
