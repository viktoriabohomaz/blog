# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'admin@example.com', password: '123456789', role: 'admin')
User.create(email: 'copy@example.com', password: '123456789', role: 'copywriter')

10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
end

30.times do
  Post.create(
    title: Faker::Lebowski.quote,
    description: Faker::Lorem.paragraph_by_chars(800, false),
    user_id: rand(1..12)
  )
end
