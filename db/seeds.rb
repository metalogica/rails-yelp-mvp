# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

food_type = ["chinese", "french", "thai", "italian", "japanese", "belgian"]

def review_generator
  url = 'https://api.adviceslip.com/advice'
  doc = URI.open(url).read
  api = JSON.parse(doc)
  review = api["slip"]["advice"]
end

def number_generator
  number = [ '+1-514-' ]
  6.times { number << rand(0..9) }
  number.join
end

30.times do
  restaurant = Restaurant.new(
    name: Faker::FunnyName.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: number_generator,
    category: food_type[rand(0...food_type.size)]
  )
  restaurant.save!
end

200.times do
  review = Review.new(
    restaurant_id: rand(1..30),
    content: review_generator,
    rating: rand(0..5)
  )
  review.save!
end
