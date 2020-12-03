require 'rails_helper'

RSpec.describe Event, type: :model do
  event = Event.new
  user = User.create(name: 'User1')
  it 'validates the presence of the title' do
    event.title = nil
    expect(event).to_not be_valid
  end
  it 'validates the presence of the description' do
    event.description = nil
    expect(event).to_not be_valid
  end
  it 'validates the presence of the venue' do
    event.date = nil
    expect(event).to_not be_valid
  end
  it 'validates the presence of the date' do
    event.title = 'Event 1'
    event.description = 'this is the description of the event'
    event.venue = 'Location 1'
    event.date = '2020-10-22'
    event.creator_id = user.id
    expect(event).to be_valid
  end
end
