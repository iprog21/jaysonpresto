class Position < ApplicationRecord

  # on users
  has_many :user_positions
  has_many :users, through: :user_positions, dependent: :destroy

  # on projects
  has_many :project_positions
  has_many :projects, through: :project_positions, dependent: :destroy

  before_save :update_slug
  def update_slug
    self.slug = self.name.parameterize if !self.name.blank?
  end
end
