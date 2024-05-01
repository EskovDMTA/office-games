json.games @games do |game|
  json.id game.id
  json.name game.name
  json.description game.description
  json.link api_v1_game_url(game)
end

