# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create users

20.times do
  User.create!(
  email: Faker::Internet.email,
  password: "helloworld"
  )
end

User.first.update_attributes(
  email: "djl132@case.edu",
  role: 'admin')

users = User.all

# create wikis - randomize ocntent, private, user
200.times do
  Wiki.create!(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.paragraph,
  private: [true,false].sample,
  user: users.sample
  )
end
