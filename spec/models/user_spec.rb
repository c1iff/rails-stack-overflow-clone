require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it 'authenticates the current user' do
    user = User.create(:email => 'user@email.com', :password => 'password123')
    expect(User.authenticate('user@email.com', 'password123')).to eq(user)
  end


end
