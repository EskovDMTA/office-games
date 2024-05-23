class Tournaments::TournamentBid < ApplicationRecord
  include AASM

  belongs_to :team
  belongs_to :tournament

  enum status: { pending: 'pending', approved: 'approved', rejected: 'reject' }

  aasm column: 'status', enum: true do
    state :pending, initial: true
    state :approved
    state :rejected

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :rejected do
      transitions from: %i[ pending approved ], to: :rejected
    end
  end
end
