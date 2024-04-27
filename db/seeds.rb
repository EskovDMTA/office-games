# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

genres = ['Action', 'Adventure', 'Role-playing (RPG)', 'Strategy', 'Simulation', 'Sports', 'Puzzle', 'Horror', 'Survival']

genres.each {|genr, index| GameType.create!(name: genr, description:index, status: 1 )}

100.times do
  game = Game.create(
    name: Faker::Game.title,
    description: Faker::Lorem.paragraph,
    game_type_id: GameType.all.pluck(:id).sample,
    status: 1
  )
end

puts "Games created"
