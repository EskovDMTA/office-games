json.genres @games_types do |genre|
  json.id genre.id
  json.name genre.name
  json.description genre.description
  json.link api_v1_game_type_url(genre)
end
