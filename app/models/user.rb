class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # on systems
  has_many :user_projects
  has_many :projects, through: :user_projects, dependent: :destroy

  # on positions
  has_many :user_positions
  has_many :positions, through: :user_positions, dependent: :destroy
end
