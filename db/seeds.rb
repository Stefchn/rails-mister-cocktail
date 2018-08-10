# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
# require 'open-uri'

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# user_serialized = open(url).read
# p user = JSON.parse(user_serialized)

# "#{user[:strIngredient1]}"
require 'open-uri'
require 'json'

ingred_url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients_hash = JSON.parse(ingred_url)
ingredients_hash["drinks"].each do |ing|
  Ingredient.create(name: ing["strIngredient1"])
end

puts "Finished"

Cocktail.create(name: 'White Russian')
Cocktail.create(name: 'Blue Lagoon')
Cocktail.create(name: 'Mai Tai')
