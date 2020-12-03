require 'rails_helper'
RSpec.describe 'Event', type: :feature do
  it 'It should create a new Event' do
    User.create(name: 'User 1')
    visit new_session_path
    fill_in 'name', with: 'User 1'
    find("input[type='submit']").click
    visit new_event_path
    fill_in 'event_title', with: 'Test event A'
    fill_in 'event_description', with: 'Testing event capybara'
    fill_in 'event_venue', with: 'Location 1'
    fill_in 'event_date', with: Date.current

    find("input[type='submit']").click
    expect(page).to have_content(/Event created!/i)
  end
end
