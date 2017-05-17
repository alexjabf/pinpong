['inigo', 'edrizio'].each do |u|
  User.create!(email: "#{u}@regalii.com", password: 'secret123')
end
puts "-- Added 2 users to your database"

puts #adding own user
User.create!(email: "alexjabf@gmail.com", password: 'secret123')