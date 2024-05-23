json.organizations @organizations do |organization|
  json.id organization.id
  json.name organization.name
  json.description organization.description
  json.teams organization.teams do |team|
    json.id team.id
    json.name team.name
    json.description team.description
    json.link api_v1_organization_url(team)
  end
end
