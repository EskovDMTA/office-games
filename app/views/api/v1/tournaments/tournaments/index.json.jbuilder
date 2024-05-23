json.tournaments @tournaments.each do |tournament|
  json.id tournament.id
  json.name tournament.name
  json.description tournament.description
  json.start_date tournament.start_date
  json.end_date tournament.end_date
  json.link api_v1_tournament_url(tournament.id)
end
