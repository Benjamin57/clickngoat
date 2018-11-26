class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @players = Player.all
  end
end
