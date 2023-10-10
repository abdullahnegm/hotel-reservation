# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create({
    username: "abdullahnegm",
    password: "123",
    name: "Abdullah Ahmed",
    phone_number: "00201033812313",
    ssn: "12345678901234",
    admin: true
})