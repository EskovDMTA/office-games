def create_teams
  Organization.all.each do |organization|
    captains = organization.users.sample(4)
    captains.each do |captain|
      captain.teams.create!(name: Faker::Team.name,
                           description: Faker::Lorem.sentence,
                           captain: captain,
                           organization: organization)
    end
  end
  puts "Teams created"
end
