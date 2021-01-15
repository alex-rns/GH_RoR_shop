# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Category.create!(
    name: Faker::Music.unique.genre
  )
end

7.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 1
  )
end

13.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 2
  )
end

12.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 3
  )
end

9.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 4
  )
end

10.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 5
  )
end