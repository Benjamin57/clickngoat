class ReviewsController < ApplicationController
  def create
    @player = Player.find(params[:player_id])
    @review = Review.new(review_params)
    @review.player = @player
    if @review.save
      respond_to do |format|
        format.html { redirect_to player_path(@player) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "players/show" }
        format.js
      end
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
