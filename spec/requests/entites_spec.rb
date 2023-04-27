require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  describe 'GET /' do
    subject { get '/' }
    before { subject }

    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'should render the index page' do
      expect(response).to render_template('static_pages/home')
    end
  end

  describe 'GET /categories' do
    context 'Render Categories' do
      let(:user) { User.create(name: 'Jerry', email: 'test@gmail.com', password: 'test12345') }
      let(:group) { Group.create(user_id: user.id, name: 'Travel', icon: 'bi-bi-airplane') }

      it 'returns http not success because of permissions' do
        get '/users/:user_id/groups'
        expect(response).to_not have_http_status(:success)
      end
    end
  end
end
