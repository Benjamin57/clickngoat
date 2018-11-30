class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  # skip_after_action :verify_policy_scoped, only: :index

  def index
    @players = policy_scope(Player.where.not(latitude: nil, longitude: nil))
    @players = @players.global_search(params[:query]) if params[:query].present?

    @markers = @players.map do |player|
          {
            lng: player.longitude,
            lat: player.latitude,
            infowindow: render_to_string(partial: "infowindow", locals: { player: player })
          }
    end
  end

  def show
    @review = Review.new
    @booking = Booking.new
    @all_reviews = Review.all
  end

  def new
    @player = Player.new
    authorize @player
  end

  def create
    @player = Player.new(player_params)
    @player.user_id = current_user.id
    if @player.save
      redirect_to player_path(@player)
    else
      render :new
    end
    authorize @player
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to dashboard_path
  end

  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
    authorize @player
  end

  def player_params
    params.require(:player).permit(:name, :city, :description, :price_per_day, :level, :position, :photo)
  end
end
