require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lead.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('leads')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
City.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities')

## Create 10 cities
10.times do |x|
  City.create(
    town: Faker::Address.city,
    country: Faker::Address.country
  )
end

## Create 20 users
20.times do |x|
  User.create(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "TEST123",
  job: Faker::Job.title,
  age: rand(18..55),
  city_id: rand(1..10))
end

## Create 100 leads
25.times do |x|
  Lead.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_id: rand(1..20)
  )
end