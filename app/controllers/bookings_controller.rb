class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit]

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
      redirect_to dashboard_path, notice: 'Booking successful, waiting for confirmation!'
    else
      render :new
    end
    authorize @booking
  end

  def show
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    authorize @booking.player
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:number_of_days, :status)
  end
end
