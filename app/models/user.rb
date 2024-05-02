class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :rememberable, :recoverable :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :owned_organizations, class_name: "Organization", foreign_key: "owner_id"
  belongs_to :organization, optional: true

  has_many :team_users
  has_many :teams, through: :team_users
end
