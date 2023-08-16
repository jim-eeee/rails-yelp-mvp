class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :rating, :content)
  end
end
