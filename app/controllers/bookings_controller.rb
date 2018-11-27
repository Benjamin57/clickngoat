class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @player = Player.find(params[:player_id])
    @booking = Booking.new(booking_params)
    @booking.player = @player
    @booking.user_id = current_user.id
    @booking.total_price = @player.price_per_day * @booking.number_of_days
    if @booking.save
      redirect_to show_new_booking_path(@booking)
    else
      render :new
    end
    authorize @booking
  end

  def show
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:number_of_days)
  end
end
