class Player < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :level, presence: true
  validates :price_per_day, presence: true
  validates :position, presence: true
end
