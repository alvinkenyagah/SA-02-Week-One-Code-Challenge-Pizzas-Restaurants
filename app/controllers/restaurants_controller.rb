class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with:  :render_unprocessable_entity
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 

  # GET /restaurants
  def index
    restaurants = Restaurant.all
    render json: restaurants
  end



  # GET /restaurants/:id
  def show
    restaurants = find_restaurant
      render json: restaurants
   
        
  end


  # DELETE /restaurants/:id
  def destroy
    restaurants = find_restaurant
    restaurants
    restaurants.destroy
    head :no_content
    
  end

  private


def render_unprocessable_entity(invalid)
  render json:{error: invalid.record.errors}, status: :unprocessable_entity
end

  def restaurant_params
    params.permit(:name, :address)
  end

  def render_not_found_response

    render json: { error: "Restaurant not found" }, status: :not_found

  end

  def find_restaurant
    Restaurant.find(params[:id])
  end

end


