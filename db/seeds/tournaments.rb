def create_tournaments
  organizations = Organization.all
  organizations.each do |organization|

    5.times do
      name = Faker::Game.title
      description = Faker::Lorem.paragraph(sentence_count: 2)
      start_date = Faker::Date.forward(days: 10)
      end_date = Faker::Date.forward(days: 20)
      game = Game.all.sample
      organization.tournaments.create(name:, start_date:, end_date:, game_id: game.id, description:)
    end
  end
end
