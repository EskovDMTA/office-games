def create_games
  50.times do
    Game.create(
      name: Faker::Game.title,
      description: Faker::Lorem.paragraph,
      game_type_id: GameType.all.pluck(:id).sample,
      status: 1
    )
  end
  puts "Games created"
end
