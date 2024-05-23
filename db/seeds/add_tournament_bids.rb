def add_tournament_bids
  organizations = Organization.all

  organizations.each do |organization|
    org_teams = organization.teams
    tournaments = organization.tournaments

    org_teams.each do |team|
      tournaments_bids = []
      tournaments.each do |tournament|
        tournaments_bids << {tournament:}
      end
      team.tournament_bids.create!(tournaments_bids)
    end
  end
  Tournaments::TournamentBid.all.update(status: 'approved')

  puts "Bids created"
end
