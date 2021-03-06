class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :player
  has_many :messages

  STATUS = ["Pending", "Accepted", "Declined"]
  validates :status, presence: true, inclusion: { in: STATUS }


end
