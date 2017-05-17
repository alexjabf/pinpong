['inigo', 'edrizio'].each do |u|
  User.create!(name: Faker::Name.name, email: "#{u}@regalii.com", password: 'secret123')
end
puts "-- Added 2 users to your database"

puts "Adding own user"
User.create!(name: Faker::Name.name, email: "alexjabf@gmail.com", password: 'secret123')

puts "Adding more sample users to have more data to work with"

for x in 1..20 do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'secret123')
end