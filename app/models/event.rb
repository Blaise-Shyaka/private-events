class Event < ApplicationRecord
  validates_presence_of :title, :description, :venue, :date

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  has_many :attendees, through: :attendances
  has_many :attendances, foreign_key: :attended_event_id

  scope :previous_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date > ?', Time.now) }
end
