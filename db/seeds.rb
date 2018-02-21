# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'James Example',
  username: 'james123',
  email: 'james@test.com',
  bio: 'Storyfinder, Citizen, Sock Hater, Perpetual Escapist, Unregulated Banker. A human. Being.'
  password: 'password',
  password_confirmation: 'password',
  profile: File.open(Rails.root + "app/assets/images/seed_images/user3.jpg")
)

User.create!(
  name: 'Mia Example',
  username: 'maomao2012',
  email: 'mia@test.com',
  bio: "Educator, Dancer, Oscar-loser, Information Addict, Ned Stark's Neck Stump. I am superb at parallel parking."
  password: 'password',
  password_confirmation: 'password',
  profile: File.open(Rails.root + "app/assets/images/seed_images/user1.jpg")
)
User.create!(
  name: 'Laura Example',
  username: 'lauraBear35',
  email: 'laura@test.com',
  bio: "Filmmaker, Explorer, Political Activist, Dollar Store Owner, Cat Stroker. I don't believe in showers"
  password: 'password',
  password_confirmation: 'password',
  profile: File.open(Rails.root + "app/assets/images/seed_images/user2.jpg")
)

User.create!(
  name: 'Bruce Airplane',
  username: 'bonzaBruce',
  email: 'bruce@test.com',
  bio: "Filmmaker, Explorer, Political Activist, Dollar Store Owner, Cat Stroker. I don't believe in showers"
  password: 'password',
  password_confirmation: 'password',
  profile: File.open(Rails.root + "app/assets/images/seed_images/user2.jpg")
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/1.jpg"),
  caption: 'The coffee here is out of this world!',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/2.jpg"),
  caption: 'Stag Stag Stag',
  user: User.find(2)
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/3.jpg"),
  caption: 'You stay classy NYC',
  user: User.find(3)
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/4.jpg"),
  caption: 'Around the world at Epcot!',
  user: User.find(4)
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/5.jpg"),
  caption: 'I feel the same way on a Monday morning',
  user: User.first
)
