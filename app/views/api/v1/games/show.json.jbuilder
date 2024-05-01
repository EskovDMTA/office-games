json.id @game.id
json.name @game.name
json.description @game.description
json.genre do
  json.genre_id @game.game_type_id
  json.genre_name @game.game_type.name
  json.link api_v1_game_type_url(@game.game_type_id)
end


