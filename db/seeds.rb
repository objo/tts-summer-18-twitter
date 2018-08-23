QUOTES = [
  Faker::Lebowski,
  Faker::MichaelScott,
  Faker::PrincessBride,
  Faker::Simpsons,
]

def create_messages(user)
  puts "Creating messages for #{user.full_name}"
  20.times {
    putc "."
    user.messages.create!({
      body: QUOTES.sample.quote,
      created_at: Faker::Date.between(2.weeks.ago, Time.now),
    })
  }
  user.save
  puts "done"
end

Message.destroy_all

puts "Generating my user"
u = User.find_or_create_by(username: "objo")
u.update_attributes({
  first_name: "Joe",
  last_name:  "O'Brien",
  city:       "Westerville",
  state:      "OH",
  bio:        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  fake:       false,
  email:      "joe@no.com",
  password:   "123456",
  password_confirmation: "123456",
})
u.save!
create_messages(u)


puts "Deleting fake users"
User.where(fake: true).destroy_all

puts "Generating fake users\n"
10.times do
  u = User.new({
    username:   Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    city:       Faker::Address.city,
    state:      Faker::Address.state_abbr,
    bio:        Faker::Lorem.paragraph,
    fake:       true,
    email:      Faker::Internet.email,
    password:   "123456",
    password_confirmation: "123456",
  })
  u.save!
  create_messages(u)
end
