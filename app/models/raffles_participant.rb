class RafflesParticipant < ApplicationRecord
  default_scope { order(position: :asc)}
  scope :waiting, -> { where(active: true)}
  scope :default_winners, -> { where(active: true, special: true  )}
  scope :candidates, -> { where(active: true, special: true, winner: false)}
  acts_as_list 
end