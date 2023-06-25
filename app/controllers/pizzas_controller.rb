class PizzasController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    # GET /pizzas
    def index
      pizzas = Pizza.all
      render json: pizzas
    end
  
    # POST /pizzas
    def create
      pizza = Pizza.create(pizza_params)
      render json: pizza, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
  
    private
  
    def pizza_params
      params.require(:pizza).permit(:name, :ingredients)
    end
  
  end
  