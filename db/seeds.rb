# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@harvard.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end



users = User.order(:created_at).take(2)

50.times do
  name = Faker::Lorem.word
  category= Faker::Lorem.word
  value= Faker::Number.number(2)
  users.each { |user| user.expenses.create!(name: name, category: category, value: value) }
end

income = 300.00
users.each { |user| user.create_budget!(income: income, remaining: income, used: 0.00) }
