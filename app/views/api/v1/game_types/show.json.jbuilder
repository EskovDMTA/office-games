json.id @game_type.id
json.genre @game_type.name
if @game_type.games.present?
  json.games @game_type.games do |game|
    json.id game.id
    json.name game.name
    json.description game.description
  end
end
