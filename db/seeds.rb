# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Tom", password: "nothing", email: "tom@tom.com", dob: "1989-02-02",gender: "male")
User.create!(name: "Alice", password: "nothing", email: "alice@alice.com", dob: "1989-02-02",gender: "female")