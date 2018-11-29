class MessagesController < ApplicationController

  def index
    # @messages = policy_scope(Message)
    @message = Message.new
    @booking = Booking.find(params[:booking_id])
    @messages = policy_scope(Message).where(booking: @booking)
  end

  def create
    @message = Message.new(message_params)
    @message.booking = Booking.find(params[:booking_id])
    @renter = @message.booking.user
    @owner = @message.booking.player.user
    @message.user = current_user
    if @message.save
      redirect_to booking_messages_path(@message.booking)
    else
      render "messages/index"
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
