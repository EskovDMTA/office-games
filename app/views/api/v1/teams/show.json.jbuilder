json.extract! @team, :id, :name, :description
json.sportsmens @team.users do |sportsmen|
  puts sportsmen.inspect
  json.id sportsmen.id
  json.email sportsmen.email
  json.first_name sportsmen.first_name
  json.last_name sportsmen.last_name
  json.profession sportsmen.profession
end
