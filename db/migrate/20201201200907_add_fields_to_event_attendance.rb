class AddFieldsToEventAttendance < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_attendances, :user, null: false, foreign_key: true
    add_reference :event_attendances, :event, null: false, foreign_key: true
  end
end
