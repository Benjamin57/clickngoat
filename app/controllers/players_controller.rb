class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  def index
    @players = policy_scope(Player)
  end

  def show
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
    redirect_to player_path(@player)
  end

  def destroy
    @player.destroy
    redirect_to players_path
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
