require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }

  it 'User should be valid' do
    expect(user).to be_valid
  end

  it 'User name should be John' do
    expect(user.name).to eq('John')
  end

  it 'User should be invalid if name is nil' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'User should be invalid if name is too short' do
    user.name = 'Jo'
    expect(user).to_not be_valid
  end

  it 'User should be invalid if name is too long' do
    user.name = 'a' * 51
    expect(user).to_not be_valid
  end
end
