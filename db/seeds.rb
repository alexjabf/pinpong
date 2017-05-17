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

puts "Populates data for leaderboard"
for x in 1..40 do
  won = [true, false].sample
  score_one = won ? 21 : 19
  score_two = score_one == 21 ? 19 : 20
  LogGame.new(date_played: (Time.now + rand(1..20).days), user_id: User.offset(rand(User.count)).first.id, opponent_id: User.offset(rand(User.count)).first.id, your_score: score_one, opponent_score: score_two, log_game_won_by_you: won).save(validate: false)
end
