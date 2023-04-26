require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(name: 'Jerry', email: 'test@gmail.com', password: 'test12345') }
  let(:group) { Group.create(user_id: user.id, name: 'Travel', icon: 'bi-bi-airplane') }
  let(:entity) { Entity.create(user_id: user.id, group_id: group.id, name: 'Grocery', amount: 5) }

  it 'Group should be valid' do
    expect(entity).to be_valid
  end

  it 'Entity name should be Grocery' do
    expect(entity.name).to eq('Grocery')
  end

  it 'Entity should be invalid if title = nil' do
    entity.name = nil
    expect(entity).to_not be_valid
  end

  it 'Entity should be invalid if amount = nil' do
    entity.amount = nil
    expect(entity).to_not be_valid
  end

  describe 'user association' do
    let(:user) { User.create(name: 'Jerry', email: 'test@gmail.com', password: 'test12345') }
    let(:group) { Group.create(user_id: user.id, name: 'Travel', icon: 'bi-bi-airplane') }
    let(:entity) { Entity.create(user_id: user.id, group_id: group.id, name: 'Grocery', amount: 5) }

    it 'belongs to a group' do
      expect(entity.group).to eq(group)
    end
  end
end
