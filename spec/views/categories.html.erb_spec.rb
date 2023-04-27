require 'rails_helper'

RSpec.describe 'Categories/public.html.erb', type: :feature do
  let(:user) { User.create(name: 'John', email: 'john@gmail.com', password: '1231231') }

  let(:group) do
    Group.create(user_id: user.id, name: 'Travel', icon: 'bi-bi-airplane')
  end

  before do
    visit user_groups_path(user)
  end

  it 'displays all categories' do
    expect(page).to_not have_selector('.categories', count: 1)
  end

  it 'displays each categories name' do
    Group.all.each do |group|
      expect(page).to have_selector('p', text: "##{group.name}")
    end
  end

  it 'displays each categories amount' do
    Group.all.each do |group|
      expect(page).to have_selector('p', text: group.amount)
    end
  end

  context 'when the user has permission to delete a recipe' do
    before do
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
    end
  end

  it "displays a 'View this group' link for each recipe" do
    Group.all.each do |_group|
      expect(page).to have_link('View this recipe', href: user_groups_path(user))
    end
  end
end
