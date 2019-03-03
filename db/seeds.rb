# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

count = 0;

puts 'Fetching Data From API...'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

puts 'Destroying all the ingredients...'
Ingredient.destroy_all

puts 'Getting all the drinks...'
ingredient['drinks'].each do |item|
  puts "Adding ingredient #{count += 1}"
  Ingredient.create!(
    name: item['strIngredient1']
  )
end

puts 'Destroying all the cocktails...'
Cocktail.destroy_all

puts 'Adding 3 cocktails...'

url = [
  'https://hips.hearstapps.com/vidthumb/images/moscow-mule-horizontal-1540909707.png',
  'https://www.inspiredtaste.net/wp-content/uploads/2011/10/Screwdriver-Cocktail-Recipe-2-1200-768x512.jpg','https://upserve.com/media/sites/2/bigstock-Cocktail-With-Cola-And-Ice-97105607-1100x600.jpg'
]

moscow_mule = Cocktail.new( name: 'Moscow Mule' )
moscow_mule.remote_photo_url = url[0]
moscow_mule.save!

screw_driver = Cocktail.new( name: 'Screw Driver' )
screw_driver.remote_photo_url = url[1]
screw_driver.save!

rum_coke = Cocktail.new( name: 'Rum and Coke' )
rum_coke.remote_photo_url = url[2]
rum_coke.save!
