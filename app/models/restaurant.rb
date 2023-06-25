
class Restaurant < ApplicationRecord
  has_many :restaurant_pizzas
  has_many :pizzas, through: :restaurant_pizzas
  protect_from_forgery with: :null_session

end
