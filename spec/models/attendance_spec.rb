require 'rails_helper'
RSpec.describe Attendance, type: :model do
  user = User.create(name: 'User1')
  Event.create(title: 'Event test', description: 'Description test',
               venue: 'Location 1', date: '2020-10-22', creator_id: user.id)
  user = User.first
  event = Event.first
  test_array = user.attended_events << event
  it 'it should be equal to event title' do
    test_array.each do |attendee|
      expect(attendee.title).to eq('Event test')
    end
  end
end
