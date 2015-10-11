class AddRefsToAttendEvent < ActiveRecord::Migration
  def change
    add_reference :attend_events, :user, index: true
    add_reference :attend_events, :event, index: true
  end
end
