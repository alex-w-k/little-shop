require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Category.create(title: Faker::Commerce.department)
end


100.times do
  Item.create(title: Faker::Commerce.product_name, description: Faker::Hipster.paragraph, price: Faker::Commerce.price, category: Category.find(rand(1..10)))
end
