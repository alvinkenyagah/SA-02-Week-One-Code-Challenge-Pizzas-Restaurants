class RestaurantPizzasController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
  
  # POST /restaurant_pizzas
  def create
    restaurant_pizzas = RestaurantPizza.create(restaurant_pizzas_params)
    render json: restaurant_pizzas ,except: [:created_at, :updated_at], status: :created
  end
  

  private

  def restaurant_pizzas_params
    params.permit(:price, :pizza_id, :restaurant_id)
  end

end

