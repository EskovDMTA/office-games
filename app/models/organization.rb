class Organization < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :users
  has_many :team_users
  has_many :teams
  has_many :tournaments, class_name: 'Tournaments::Tournament'

  validates :name, :description, :address, :email, :telegram, :owner_id, presence: true

  validates :name, length: { minimum: 3, maximum: 50 }, uniqueness: true
  validates :telegram, length: { minimum: 3, maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :description, length: { minimum: 15, maximum: 250 }
  validates :address, length: { minimum: 3, maximum: 100 }

  validates :email, presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            length: { minimum: 3, maximum: 50 }
end
