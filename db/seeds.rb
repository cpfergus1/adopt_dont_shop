# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy.all
User.destroy.all

Shelter.create!([
  {id: 1, name: "Windsor Animal Shelter", address: "3321 Windsor Lane", city: "Windsor", state: "Colorado", zip: 80550},
  {id: 2, name: "Denver Animal Shelter", address: "3321 Denver Lane", city: "Denver", state: "Colorado", zip: 80234}
])

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


Pet.create!([
  {image: "https://i.guim.co.uk/img/media/20098ae982d6b3ba4d70ede3ef9b8f79ab1205ce/0_0_969_1005/master/969.jpg?width=700&quality=85&auto=format&fit=max&s=470657ebd2a0e704df88997d393aea15", name: "Roxanne Everfluff", description: "afdfads", age: 1, sex: "male", status: "Available", shelter_id: 1},
  {image: "https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg", name: "Fluff Puff McFluffers", description: "Fluffy", age: 1, sex: "male", status: "Available", shelter_id: 2},
  {image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7OwW3v8BH3CP3aAvKPODpS8RCnWjtBsPIuw&usqp=CAU", name: "Smug Pug McSchweets", description: "Super smug", age: 1, sex: "male", status: "Available", shelter_id: 2},
  {image: "https://i.insider.com/5de5784979d757159d0b6838?width=1100&format=jpeg&auto=webp", name: "George Jefferson James Henry", description: "Super Good Boy", age: 5, sex: "male", status: "Available", shelter_id: 1}
])

Review.create!([
  {title: "I want to test", rating: 1.0, content: "This is jimbob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", shelter_id: 1, user_id: 1},
  {title: "This", rating: 1.0, content: "This is joebob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", shelter_id: 2, user_id: 2},
  {title: "Was", rating: 1.0, content: "This is jerrybob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", shelter_id: 2, user_id: 3},
  {title: "A", rating: 1.0, content: "This is jeffreybob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", shelter_id: 1, user_id: 4},
  {title: "Test", rating: 1.0, content: "This is jordanbob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", shelter_id: 1, user_id: 5}
])


User.create!([
  {name: "Jim Bob", address: "11134 Jimbob Lane", city: "Colorado Springs", state: "Colorado", zip: 80523},
  {name: "Joe Bob", address: "11134 Joebob Lane", city: "Colorado Springs", state: "Colorado", zip: 80522},
  {name: "Jerry Bob", address: "11134 Jerrybob Lane", city: "Denver", state: "Colorado", zip: 80521},
  {name: "Jefferey Bob", address: "11134 Jeffreybob Lane", city: "Denver", state: "Colorado", zip: 80525},
  {name: "Jordan Bob", address: "11134 Jordanbob Lane", city: "Windsor", state: "Colorado", zip: 80524}
])
