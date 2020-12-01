class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :event_attendance, source: :attendee
end
