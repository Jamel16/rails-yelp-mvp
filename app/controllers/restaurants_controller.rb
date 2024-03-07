class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :create_review]
  def index
    @restaurants = Restaurant.all
  end

  def new_review
    @review = Review.new
  end

  def create_review
    @review = @restaurant.reviews.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :show
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save!
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
