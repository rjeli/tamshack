class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :creator_id, presence: true

  belongs_to :user
  belongs_to :creator, class_name: "User", foreign_key: :creator_id

  has_many :attend_events
  has_many :users, through: :attend_events
end
