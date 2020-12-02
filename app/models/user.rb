class User < ApplicationRecord
  validates :name, presence: true

  has_many :created_events, foreign_key: :creator_id, class_name: :Event
  has_many :attendances, foreign_key: :atendee_id
  has_many :attended_events, through: :attendances
end
