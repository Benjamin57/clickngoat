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
  validates :photo, presence: true
  validates :city, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  has_many :reviews, dependent: :destroy

  include PgSearch
  pg_search_scope :global_search,
    :against => {
      :city => 'A',
      :level => 'B',
      :position => 'C',
      :description => 'D',
      :name => 'D'
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
