def add_employees_to_teams
  organizations = Organization.all
  organizations.each do |organization|
    organization_users = organization.users
    organization.teams.each do |team|
      team_users = team.users
      employees_without_team = organization_users.where.not(id: team_users.pluck(:id)).limit(2)
      team.users << employees_without_team
    end
  end
  puts "employees added to teams"
end
