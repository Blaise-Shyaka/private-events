class User < ApplicationRecord
  validates :name, presence: true

  has_many :created_events, foreign_key: :creator_id, class_name: :Event
  has_many :attendances, foreign_key: :atendee_id
  has_many :attended_events, through: :attendances

  def upcoming_events
    attended_events.select { |t| t.date.to_s > Time.now.to_s }
  end

  def previous_events
    attended_events.select { |t| t.date.to_s < Time.now.to_s }
  end

  def upcoming_created_events
    created_events.select { |t| t.date.to_s > Time.now.to_s }
  end

  def previous_created_events
    created_events.select { |t| t.date.to_s < Time.now.to_s }
  end
end
