def create_tournaments
  bracket_types = %w[DoubleElimination SingleElimination]
  organizations = Organization.all
  organizations.each do |organization|

    5.times do |index|
      name = "#{Faker::Game.title} + #{index}"
      description = Faker::Lorem.paragraph(sentence_count: 1)
      start_date = Faker::Date.forward(days: 10)
      end_date = Faker::Date.forward(days: 20)
      game = Game.all.sample
      bracket_type = bracket_types.sample
      puts bracket_type
      organization.tournaments.create(name:, start_date:, end_date:, game_id: game.id, description:, bracket_type:)
    end
    puts "Tournaments created"
  end
end
