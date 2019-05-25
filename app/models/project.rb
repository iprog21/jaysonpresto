class Project < ApplicationRecord

  # on users
  has_many :user_projects
  has_many :users, through: :user_projects, dependent: :destroy

  # on posistions
  has_many :project_positions
  has_many :positions, through: :project_positions, dependent: :destroy

  before_save :update_slug
  def update_slug
    self.slug = self.name.parameterize if !self.name.blank?
  end
end
