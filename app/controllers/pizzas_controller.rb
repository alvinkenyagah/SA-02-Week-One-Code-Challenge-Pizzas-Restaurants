class PizzasController < ApplicationController

  # GET /pizzas
  def index
    pizzas = Pizza.all
    render json: pizzas
  end

  # POST /pizzas
  def create
    pizzas = Pizza.create(bird_params)
    render json: pizzas, status: :created
  end


  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

  def render_not_found_response

    render json: { error: "Bird not found" }, status: :not_found

  end

  def find_bird
    Bird.find(params[:id])
  end



    
end
