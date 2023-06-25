class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with:  :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
    skip_before_action :verify_authenticity_token, only: [:destroy]

    
      # GET /restaurants
      def index
        restaurants = Restaurant.all
        render json: restaurants, except: [:created_at, :updated_at], status: :ok 
      end
    
    
    
      # GET /restaurants/:id
      def show
        restaurants = find_restaurants
        
          render json: restaurants, except: [:id, :created_at, :updated_at], status: :ok                 
      end

    
      # DELETE /restaurants/:id
      def destroy
        restaurants = find_restaurants
        render json: restaurants 
        restaurants.destroy
        head :no_content        
      end
    
      private
    
    
    def render_unprocessable_entity(invalid)
      render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end
    
    
      def render_not_found_response
    
        render json: { error: "Restaurant not found" }, status: :not_found
    
      end
    
      def find_restaurants
        Restaurant.find(params[:id])
      end
    
    end

