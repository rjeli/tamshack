class AttendEvent < ActiveRecord::Base
  validates :event_id, presence: true
  validates :user_id, presence: true

  belongs_to :event
  belongs_to :user

  def event_creator_id
    Event.find(self.event_id).creator_id
  end
end
