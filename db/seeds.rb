require_relative 'seeds/genres'
require_relative 'seeds/games'
require_relative 'seeds/users'
require_relative 'seeds/organizations'
require_relative 'seeds/add_employees_to_organization'
require_relative 'seeds/teams'
require_relative 'seeds/add_employees_to_teams'

create_genres

create_games

create_users

create_organizations

add_employees_to_organizations

create_teams

add_employees_to_teams
