User.create!(
  name: "James Example",
  username: "james123",
  email: "james@test.com",
  bio: "Storyfinder, Citizen, Sock Hater, Perpetual Escapist, Unregulated Banker. A human. Being",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user3.jpg")
)

User.create!(
  name: "Mia Example",
  username: "maomao2012",
  email: "mia@test.com",
  bio: "Educator, Dancer, Oscar-loser, Information Addict, Ned Stark's Neck Stump. I am superb at parallel parking.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user1.jpg")
)
User.create!(
  name: "Laura Example",
  username: "lauraBear35",
  email: "laura@test.com",
  bio: "Filmmaker, Explorer, Political Activist, Dollar Store Owner, Cat Stroker. I don't believe in showers",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user2.jpg")
)

User.create!(
  name: "Bruce Airplane",
  username: "bonzaBruce",
  email: "bruce@test.com",
  bio: "Filmmaker, Explorer, Political Activist, Dollar Store Owner, Cat Stroker. I don't believe in showers",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user2.jpg")
)

User.create!(
  name: "Steve Carroll",
  username: "stevo",
  email: "stevo@test.com",
  bio: "Doctor, Alcoholic, Amateur Chef, Creator of Systems, Your long lost twin. I used to think that you could just go to the bank and ask for money.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user3.jpg")
)

User.create!(
  name: "Randy Jimenez",
  username: "randy",
  email: "randy@test.com",
  bio: "Avatar, Hiker, Wearer of unrelated hats, Information Addict, The Housing Bubble. The 7th Avenger.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user4.jpg")
)

User.create!(
  name: "Kristen Day",
  username: "kristen89",
  email: "kristen@test.com",
  bio: "Believer, Comedian, Mother of two, Gender Activist, Wet Old Coffee Grounds. I probably still live in my mom's basement.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user5.jpg")
)

User.create!(
  name: "Stacey Simmons",
  username: "Simmoooo101",
  email: "kriusersten@test.com",
  bio: "Consultant, Mastermind, Veteran Startup Operator, Public Speaker, Game Show Guru. I sneak drinks into movie theatres.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user6.jpg")
)

User.create!(
  name: "Theodore Adams",
  username: "TheoTheoTheo",
  email: "theo@test.com",
  bio: "Achiever, Disrupter, Water Protector, Sunshine Addict, Disgruntled Typist. I think about the origin of the universe while showering.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user7.jpg")
)

User.create!(
  name: "Gavin Johnson",
  username: "gavjohno",
  email: "gav@test.com",
  bio: "Humanitarian, Entertainer, Powerful Multitasker, Idea Pimp, Food Court Nightwatchman. I make up a dream in my head before I go to bed.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user8.jpg")
)

User.create!(
  name: "Floyd O'Brien",
  username: "fob123",
  email: "floyd@test.com",
  bio: "Singer, Comedian, Happiness Seeker, Strategic Storyteller. I am a really giant cupcake.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user9.jpg")
)

User.create!(
  name: "Aiden King",
  username: "aidie",
  email: "ade@test.com",
  bio: "Dancer, Learner, Voice Actor, Founder of People, Paper slapper. I hide my sweat well.",
  password: "password",
  password_confirmation: "password",
  profile: File.open(Rails.root + "app/assets/images/seed_images/user10.jpg")
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post1.jpg"),
  caption: "A great day out at the cricket!",
  location: 'Leicester Square',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post2.jpg"),
  caption: "Whiteways Cup",
  location: 'Whimple Cricket Club',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post3.jpg"),
  caption: "Enjoying the weather",
  location: 'Whimple Cricket Club',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post4.jpg"),
  caption: "This match is really bad",
  location: 'Wembley Stadium',
  user: User.first
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post5.jpg"),
  caption: "Stag Stag Stag",
  user: User.find(2)
)
#
# Post.create!(
#   picture: File.open(Rails.root + "app/assets/images/seed_images/post5.jpg"),
#   caption: "Just doing the Lords tour",
#   location: 'Lords Cricket Ground',
#   user: User.find(2)
# )

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post6.jpg"),
  caption: "Aussie's seeing the sights",
  location: 'Tower Bridge',
  user: User.find(3)
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post7.jpg"),
  caption: "Lets do this!",
  location: 'Military Fitness',
  user: User.find(4)
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post8.jpg"),
  caption: "Just another caption",
  location: 'Exmouth Harbour',
  user: User.find(5)
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post9.jpg"),
  caption: "Pete loves his hat",
  location: 'Epsom High Street',
  user: User.find(5)
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post10.jpg"),
  caption: "Here's what you could have won.",
  location: 'Epsom River Club',
  user: User.find(6)
)

Post.create!(
  picture: File.open(Rails.root + "app/assets/images/seed_images/post11.jpg"),
  caption: "Mini golf madness",
  location: 'Guernsey Mini Golf',
  user: User.find(6)
)
