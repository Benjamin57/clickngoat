class ReviewsController < ApplicationController
  def create
    @player = Player.find(params[:player_id])
    @review = Review.new(review_params)
    @review.player = @player
    @player.average_rating = 0
    @total_ratings = []
    @player.reviews.each do |review|
      @total_ratings << review.rating
    end
    @player.average_rating = @total_ratings.sum.to_f / @player.reviews.count.to_f
    @player.save
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
