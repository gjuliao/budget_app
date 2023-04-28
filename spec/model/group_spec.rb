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

  it 'is invalid with a name shorter than 3 characters' do
    group.name = 'Hi'
    expect(group).not_to be_valid
  end

  it 'is invalid with a name longer than 50 characters' do
    group.name = 'a' * 51
    expect(group).not_to be_valid
  end

  it 'is invalid with an icon shorter than 3 characters' do
    group.icon = 'a' * 2
    expect(group).not_to be_valid
  end

  it 'is invalid with an icon longer than 150 characters' do
    group.icon = 'a' * 151
    expect(group).not_to be_valid
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(group.user).to eq(user)
    end

    it 'has many entities' do
      entity1 = Entity.create(name: 'Entity 1', group_id: group.id)
      entity2 = Entity.create(name: 'Entity 2', group_id: group.id)
      expect(group.entities).to match_array([entity1, entity2])
    end

    it 'has and belongs to many entities' do
      entity1 = Entity.create(name: 'Entity 1')
      entity2 = Entity.create(name: 'Entity 2')
      group.entities << [entity1, entity2]
      expect(group.entities).to match_array([entity1, entity2])
    end
  end

  describe '#sum_numbers' do
    it 'returns the sum of an array of numbers' do
      numbers = [1, 2, 3, 4, 5]
      expect(group.sum_numbers(numbers)).to eq(15)
    end

    it 'returns 0 if the array is empty' do
      numbers = []
      expect(group.sum_numbers(numbers)).to eq(0)
    end
  end
end
