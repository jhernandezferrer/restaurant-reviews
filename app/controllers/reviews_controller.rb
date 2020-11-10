class ReviewsController < ApplicationController
  before_action :find_restaurant, except: [:destroy]
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
    #To relacionate the review with the restaurants_id
    redirect_to restaurant_path(@restaurant)
    else
      # Render is a page
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def find_restaurant
    # In the review, restaurant ID is not :id. It is -> :restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
