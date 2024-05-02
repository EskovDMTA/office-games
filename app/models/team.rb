class Team < ApplicationRecord
  belongs_to :organization
  belongs_to :captain, class_name: "User", optional: true
  has_many :team_users
  has_many :users, through: :team_users
end
