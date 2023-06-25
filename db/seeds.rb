# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    pizzas = Pizza.create(name:Faker::Food.dish,ingredients:Faker::Food.ingredient)
end
    
10.times do
    restaurants = Restaurant.create(name:Faker::Restaurant.name,address:Faker::Address.street_address)
end
    

pizzas = Pizza.all
restaurants = Restaurant.all


10.times do
    restaurant = restaurants.sample
    pizza = pizzas.sample
    price = Faker::Number.between(from: 1, to: 30)
  
    RestaurantPizza.create(price: price,restaurant: restaurant,pizza: pizza)
end
