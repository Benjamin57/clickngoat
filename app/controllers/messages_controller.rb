class MessagesController < ApplicationController

  def index
    @messages = policy_scope(Message)
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @booking.user_id = current_user.id
    @message = Message.new(message_params)


  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :booking_id)
  end
end
