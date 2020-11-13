# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

ingredients_list = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
general_response = URI.open(ingredients_list).read
repos_general_response = JSON.parse(general_response)
ingredients_seed = repos_general_response["drinks"]

puts "Seeding Ingredients... started..."

add_ingredients = ['lemon', 'ice', 'mint leaves']

add_ingredients.each do |add_ingredient|
  puts "Adding #{add_ingredient}"
  Ingredient.create(name: add_ingredient)
end

ingredients_seed.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
  puts "Adding #{ingredient["strIngredient1"]}"
end

puts "Seeding Ingredients... finished..."
