class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @review = Review.new
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.all.where("restaurant_id = #{@restaurant.id}")
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      respond_to do |format|
        format.html { redirect_to(restaurant_path(@restaurant)) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js
      end
    end
  end

  def destroy

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
