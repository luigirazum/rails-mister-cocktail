# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
require 'rest-client'
require 'json'

ingredients_list = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
general_response = RestClient.get ingredients_list
repos_general_response = JSON.parse(general_response)
ingredients_seed = repos_general_response["drinks"]

puts "Seeding Ingredients... started..."

ingredients_seed.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
  puts "Adding #{ingredient["strIngredient1"]}"
end

puts "Seeding Ingredients... finished..."
