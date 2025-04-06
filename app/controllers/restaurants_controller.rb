class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show

  def index
    @restaurants = Restaurant.all
    filter_by_query if params[:q]
    filter_by_city if params[:city]
    filter_by_category if params[:category]
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def filter_by_query
    @restaurants = @restaurants.where("name ILIKE ? OR description ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
  end

  def filter_by_city
    @restaurants = @restaurants.where(city: params[:city])
  end

  def filter_by_category
    @restaurants = @restaurants.select do |r|
      r.category.title == params[:category]
    end
  end
end
