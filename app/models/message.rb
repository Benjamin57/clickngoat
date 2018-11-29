class Message < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :user, presence: true
  validates :booking, presence: true
  validates :content, presence: true

end
