class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :event_attendances, source: :attendee
  has_many :event_attendances, foreign_key: :attended_event_id
end
