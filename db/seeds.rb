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
  password: 'password',
  password_confirmation: 'password'
)

User.create!(
  name: 'Mia Example',
  username: 'mia123',
  email: 'mia@test.com',
  password: 'password',
  password_confirmation: 'password'
)
User.create!(
  name: 'Laura Example',
  username: 'laura123',
  email: 'laura@test.com',
  password: 'password',
  password_confirmation: 'password'
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/1.jpg"),
  caption: 'The coffee here is out of this world!',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/2.jpg"),
  caption: 'Stag Stag Stag',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/3.jpg"),
  caption: 'You stay classy NYC',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/4.jpg"),
  caption: 'Around the world at Epcot!',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/5.jpg"),
  caption: 'I feel the same way on a Monday morning',
  user: User.first
)
