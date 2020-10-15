# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
User.destroy_all

Shelter.create!([
  {name: "Windsor Animal Shelter", address: "3321 Windsor Lane", city: "Windsor", state: "Colorado", zip: 80550},
  {name: "Denver Animal Shelter", address: "3321 Denver Lane", city: "Denver", state: "Colorado", zip: 80234}
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

denver.pets.create!([
  {image: "https://i.guim.co.uk/img/media/20098ae982d6b3ba4d70ede3ef9b8f79ab1205ce/0_0_969_1005/master/969.jpg?width=700&quality=85&auto=format&fit=max&s=470657ebd2a0e704df88997d393aea15", name: "Roxanne Everfluff", description: "afdfads", age: 1, sex: "male", status: "Available"},
  {image: "https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg", name: "Fluff Puff McFluffers", description: "Fluffy", age: 1, sex: "male", status: "Available"},
  {image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7OwW3v8BH3CP3aAvKPODpS8RCnWjtBsPIuw&usqp=CAU", name: "Smug Pug McSchweets", description: "Super smug", age: 1, sex: "male", status: "Available"},
  {image: "https://i.insider.com/5de5784979d757159d0b6838?width=1100&format=jpeg&auto=webp", name: "George Jefferson James Henry", description: "Super Good Boy", age: 5, sex: "male", status: "Available"}
])
boulder.pets.create!([
  {image: "https://i.guim.co.uk/img/media/20098ae982d6b3ba4d70ede3ef9b8f79ab1205ce/0_0_969_1005/master/969.jpg?width=700&quality=85&auto=format&fit=max&s=470657ebd2a0e704df88997d393aea15", name: "Roxanne Everfluff", description: "afdfads", age: 1, sex: "male", status: "Available"},
  {image: "https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg", name: "Fluff Puff McFluffers", description: "Fluffy", age: 1, sex: "male", status: "Available"},
  {image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7OwW3v8BH3CP3aAvKPODpS8RCnWjtBsPIuw&usqp=CAU", name: "Smug Pug McSchweets", description: "Super smug", age: 1, sex: "male", status: "Available"},
  {image: "https://i.insider.com/5de5784979d757159d0b6838?width=1100&format=jpeg&auto=webp", name: "George Jefferson James Henry", description: "Super Good Boy", age: 5, sex: "male", status: "Available"}
])
broomfield.pets.create!([
  {image: "https://i.guim.co.uk/img/media/20098ae982d6b3ba4d70ede3ef9b8f79ab1205ce/0_0_969_1005/master/969.jpg?width=700&quality=85&auto=format&fit=max&s=470657ebd2a0e704df88997d393aea15", name: "Roxanne Everfluff", description: "afdfads", age: 1, sex: "male", status: "Available"},
  {image: "https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg", name: "Fluff Puff McFluffers", description: "Fluffy", age: 1, sex: "male", status: "Available"},
  {image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7OwW3v8BH3CP3aAvKPODpS8RCnWjtBsPIuw&usqp=CAU", name: "Smug Pug McSchweets", description: "Super smug", age: 1, sex: "male", status: "Available"},
  {image: "https://i.insider.com/5de5784979d757159d0b6838?width=1100&format=jpeg&auto=webp", name: "George Jefferson James Henry", description: "Super Good Boy", age: 5, sex: "male", status: "Available"}
])

User.create!([
  {name: "Jim Bob", address: "11134 Jimbob Lane", city: "Colorado Springs", state: "Colorado", zip: 80523},
  {name: "Joe Bob", address: "11134 Joebob Lane", city: "Colorado Springs", state: "Colorado", zip: 80522},
  {name: "Jerry Bob", address: "11134 Jerrybob Lane", city: "Denver", state: "Colorado", zip: 80521},
  {name: "Jefferey Bob", address: "11134 Jeffreybob Lane", city: "Denver", state: "Colorado", zip: 80525},
  {name: "Jordan Bob", address: "11134 Jordanbob Lane", city: "Windsor", state: "Colorado", zip: 80524}
  ])

denver.reviews.create!([
  {title: "I want to test", rating: 1.0, content: "This is jimbob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "This", rating: 1.0, content: "This is joebob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "Was", rating: 1.0, content: "This is jerrybob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "A", rating: 1.0, content: "This is jeffreybob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Joe Bob").id },
  {title: "Test", rating: 1.0, content: "This is jordanbob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Joe Bob").id }
])

boulder.reviews.create!([
  {title: "I want to test", rating: 1.0, content: "This is jimbob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "This", rating: 1.0, content: "This is joebob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "Was", rating: 1.0, content: "This is jerrybob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "A", rating: 1.0, content: "This is jeffreybob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Joe Bob").id },
  {title: "Test", rating: 1.0, content: "This is jordanbob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Joe Bob").id }
])

broomfield.reviews.create!([
  {title: "I want to test", rating: 1.0, content: "This is jimbob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "This", rating: 1.0, content: "This is joebob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "Was", rating: 1.0, content: "This is jerrybob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Jim Bob").id },
  {title: "A", rating: 1.0, content: "This is jeffreybob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Joe Bob").id },
  {title: "Test", rating: 1.0, content: "This is jordanbob's test", pic: "https://www.computerhope.com/jargon/g/guest-user.jpg", user_name: "Jimbob", user_id: User.find_by(name: "Joe Bob").id }
])
