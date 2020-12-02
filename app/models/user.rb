class User < ApplicationRecord
  validates :name, presence: true

  has_many :created_events, foreign_key: :creator_id, class_name: :Event
  has_many :attended_events, through: :attendances
  has_many :attendances, foreign_key: :attendee_id

  def upcoming_events
    attended_events.select { |t| t.event_date.to_s > Time.now.to_s }
  end

  def previous_events
    attended_events.select { |t| t.event_date.to_s < Time.now.to_s }
  end

  def upcoming_created_events
    created_events.select { |t| t.event_date.to_s > Time.now.to_s }
  end

  def previous_created_events
    created_events.select { |t| t.event_date.to_s < Time.now.to_s }
  end
end
