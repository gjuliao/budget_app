require 'rails_helper'

RSpec.describe 'Entites/public.html.erb', type: :feature do
  let(:user) { User.create(name: 'John', email: 'john@gmail.com', password: '1231231') }

  let(:group) do
    Group.create(user_id: user.id, name: 'Travel', icon: 'bi-bi-airplane')
  end

  let(:entity) { Entity.create(user_id: user.id, group_id: group.id, name: 'Grocery', amount: 5) }

  before do
    visit user_groups_path(user)
  end

  it 'displays all Entities' do
    expect(page).to_not have_selector('.entities', count: 1)
  end

  it 'displays each entity name' do
    Entity.all.each do |entity|
      expect(page).to have_selector('p', text: "##{entity.name}")
    end
  end

  it 'displays each entity amount' do
    Entity.all.each do |entity|
      expect(page).to have_selector('p', text: entity.amount)
    end
  end

  it "displays a 'View this group' link for each recipe" do
    Entity.all.each do |entity|
      expect(page).to have_link('View this entity', href: user_group_entity_path(user, entity))
    end
  end
end
