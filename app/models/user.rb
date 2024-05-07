class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :rememberable, :recoverable :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :owned_organizations, class_name: "Organization", foreign_key: "owner_id"
  belongs_to :organization, optional: true

  has_many :team_users
  has_many :teams, through: :team_users

  has_many :tournaments_matches, class_name: 'Tournaments::Match', as: :participant1
  has_many :tournaments_matches, class_name: 'Tournaments::Match', as: :participant2

  has_many :tournaments_match_results, class_name: 'Tournaments::MatchResult', as: :participant1
  has_many :tournaments_match_results, class_name: 'Tournaments::MatchResult', as: :participant2

  has_many :tournaments_tournaments, class_name: 'Tournaments::Tournament', as: :winner
end
