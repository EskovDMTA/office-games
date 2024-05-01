class Game < ApplicationRecord
  include AASM

  enum status: { pending_approval: 0, approved: 1, rejected: 2 }

  belongs_to :game_type, counter_cache: true
  has_many :comments, as: :commentable

  aasm column: 'status', enum: true do
    state :pending_approval, initial: true
    state :approved
    state :rejected

    event :request_approval do
      transitions from: :pending_approval, to: :approved
    end

    event :reject do
      transitions from: %i[pending_approval approved], to: :rejected
    end
  end

  validates :name, uniqueness: true
end
