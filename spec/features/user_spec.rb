require 'rails_helper'
RSpec.describe 'User', type: :feature do
  it 'It should create a new user' do
    visit new_user_path
    fill_in 'user_name', with: 'user test'
    find("input[type='submit']").click
    expect(page).to have_content(/Successfully signed up!/i)
  end
end