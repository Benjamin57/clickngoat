class Player < ApplicationRecord
  belongs_to :user

  LEVELS = ["Legend", "World-class", "Professional", "Ligue1", "Regional", "Goat", "World-goat"]
  POSITIONS = ["Forward", "Midfielder", "Center-back", "Wing-back", "Goal-keeper", "Substitute"]

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :level, presence: true, inclusion: { in: LEVELS }
  validates :price_per_day, presence: true
  validates :position, presence: true, inclusion: { in: POSITIONS }
  mount_uploader :photo, PhotoUploader
  validates :city, presence: true
end
