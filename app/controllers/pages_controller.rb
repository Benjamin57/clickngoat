class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @players = Player.all
  end

  def dashboard
    @players = current_user.players
    @bookings = current_user.bookings
  end
end
