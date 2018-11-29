class ReviewsController < ApplicationController
  def create
    @player = Player.find(params[:player_id])
    @review = Review.new(review_params)
    @review.player = @player
    if @review.save
      redirect_to player_path(@player)
    else
      render "players/show"
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
