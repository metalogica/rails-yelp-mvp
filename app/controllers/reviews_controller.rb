class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(@review.restaurant_id)
    if @review.save
      respond_to do |format|
        format.html { redirect_to(restaurant_path(@restaurant))}
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/new' }
        format.js
      end
    end
  end

  private

  def review_params
    params[:review][:restaurant_id] = params[:restaurant_id]
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
