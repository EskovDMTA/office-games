json.id @tournament.id
json.name @tournament.name
json.organization api_v1_organizations_url(@tournament.organization)
json.description @tournament.description
json.game @tournament.game.name
json.matches @tournament.matches
json.bracket_type @tournament.bracket_type
json.bracket @tournament.bracket
