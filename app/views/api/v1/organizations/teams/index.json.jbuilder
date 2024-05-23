if @teams.present?
  json.teams @teams do |team|
    json.name team.name
    json.link api_v1_organization_teams_path(team.id)
  end
end

