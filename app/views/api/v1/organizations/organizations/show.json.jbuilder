json.organization do
  json.name @organization.name
  json.description @organization.description
  json.email @organization.email
  json.telegram @organization.telegram
  json.owner @organization.owner_id
  json.sportsmen @organization.users.each do |user|
    json.email user.email
    json.link user.first_name
  end
end
