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
    @pick = params[:booking][:pick_your_date]
    @pick = @pick.split(" to ")
    @booking.end_date = @pick.last
    @booking.number_of_days = (@pick[1].to_date - @pick[0].to_date).to_i + 1
    @booking.player = @player
    @booking.user_id = current_user.id
    @booking.total_price = @player.price_per_day * @booking.number_of_days
    if @booking.save
      redirect_to dashboard_path, notice: "Booking created! Waiting for confirmation"
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    authorize @booking
    @booking.save
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "Declined"
    authorize @booking
    @booking.save
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:pick_your_date, :status)
  end
end
