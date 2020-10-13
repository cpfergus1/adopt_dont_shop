# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
denver = Shelter.create(name: "Denver Furry Pals",
               address: "123 Denver St",
               city: "Denver",
               state: "CO",
               zip: "80020")

boulder = Shelter.create(name: "Boulder Furry Pals",
               address: "123 Boulder St",
               city: "Boulder",
               state: "CO",
               zip: "80005")

broomfield = Shelter.create(name: "Broomfield Furry Pals",
               address: "123 Broomfield St",
               city: "Broomfield",
               state: "CO",
               zip: "80260")

denver.pets.create(image: "https://images.dog.ceo/breeds/frise-bichon/stevebaxter_bichon_frise.jpg",
           name: "Jim",
           description: "Friendly",
           age: "4",
           sex: "M",
           shelter_id: denver.id,
           status: 'Adoptable')

boulder.pets.create(image: "https://images.dog.ceo/breeds/poodle-toy/n02113624_5278.jpg",
           name: "Bob",
           description: "Playful",
           age: "1",
           sex: "M",
           shelter_id: boulder.id,
           status: 'Adoptable')

broomfield.pets.create(image: "https://images.dog.ceo/breeds/appenzeller/n02107908_4903.jpg",
           name: "Fran",
           description: "Calm",
           age: "1",
           sex: "F",
           shelter_id: broomfield.id,
           status: 'Adoption Pending')
