require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new

  it 'is valid when the name is present' do
    user.name = 'User1'
    expect(user).to be_valid
  end

  it 'is valid when name is present' do
    user.name = nil
    expect(user).to_not be_valid
  end
end
