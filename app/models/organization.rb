class Organization < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :users
  has_many :team_users
  has_many :teams
end
