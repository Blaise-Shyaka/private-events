class User < ApplicationRecord
  validates :name, presence: true
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attended_events, through: :event_attendance, source: :attended_event
end
