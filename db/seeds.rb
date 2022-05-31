# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
begin_date = 2.years.ago
end_date = Date.today

users_params = 100.times.map do
     { name: Faker::Name.name,
       
    email: Faker::Internet.unique.email,
    created_at: Faker::Date.between(from: begin_date, to: end_date) }
end

User.create(users_params)