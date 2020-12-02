class Attendance < ApplicationRecord
  belongs_to :atendee, class_name: :User
  belongs_to :attended_event, class_name: :Event
end
