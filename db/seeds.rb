# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  Category.create!(
    name: Faker::Music.unique.genre
  )
end

Category.create!(
  name: Faker::Music.unique.genre,
  parent_id: 1
)

2.times do
  Category.create!(
    name: Faker::Music.unique.genre,
    parent_id: 3
  )
end

3.times do
  Category.create!(
    name: Faker::Music.unique.genre,
    parent_id: 4
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

7.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 5
  )
end

8.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 6
  )
end

7.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 7
  )
end

2.times do
  Product.create!(
    name: Faker::Music.unique.band,
    description: Faker::Lorem.sentence(word_count: 100),
    price: Faker::Number.decimal(l_digits: 3),
    image: Faker::Placeholdit.image,
    category_id: 8
  )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?