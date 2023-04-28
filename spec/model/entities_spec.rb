require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(name: 'Jerry', email: 'test@gmail.com', password: 'test12345') }
  let(:group) { Group.create(user_id: user.id, name: 'Travel', icon: 'bi-bi-airplane') }
  let(:entity) { Entity.create(user_id: user.id, group_id: group.id, name: 'Grocery', amount: 5.0, groups: [group]) }

  describe 'validations' do
    it 'Entity should be valid' do
      expect(entity).to be_valid
    end

    it 'is invalid without a name' do
      entity.name = nil
      expect(entity).not_to be_valid
    end

    it 'is invalid with a name shorter than 3 characters' do
      entity.name = 'Hi'
      expect(entity).not_to be_valid
    end

    it 'is invalid with a name longer than 50 characters' do
      entity.name = 'a' * 51
      expect(entity).not_to be_valid
    end

    it 'is invalid without an amount' do
      entity.amount = nil
      expect(entity).not_to be_valid
    end

    it 'is invalid with a negative amount' do
      entity.amount = -1
      expect(entity).not_to be_valid
    end

    it 'is valid with an amount of 0' do
      entity.amount = 0
      expect(entity).to be_valid
    end

    it 'is valid with a positive amount' do
      entity.amount = 10
      expect(entity).to be_valid
    end

    it 'is invalid without any groups' do
      entity.groups = []
      expect(entity).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(entity.user).to eq(user)
    end
  end
end
