require 'rails_helper'

RSpec.describe Group, type: :model do
    let(:user) { User.create(name: 'Jerry', email: 'test@gmail.com', password: 'test12345') }
    let(:group) { Group.create(user_id: user.id, name: 'Travel', icon: 'bi-bi-airplane') }

  it 'Group should be valid' do
    expect(group).to be_valid
  end

  it 'Group name should be Travel' do
    expect(group.name).to eq('Travel')
  end

  it 'Group should be invalid if title = nil' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'Group should be invalid if icon = nil' do
    group.icon = nil
    expect(group).to_not be_valid
  end
end
