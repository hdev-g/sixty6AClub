# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Updating desks..."

Desk.destroy_all

Desk.create({
  type: "Desk",
  capacity: 4,
  price: 18
})

puts "Finished creating desks"

puts "Creating admin users"

User.create({
  email: "harris@test.com",
  password: "test1234",
  first_name: "Harris",
  last_name: "Grant",
  is_admin?: true,
  business: "EMCA"
})
