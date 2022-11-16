require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
    end
  end

  it 'Renders the index view template' do
    get users_path
    expect(response).to render_template(:index)
  end

  it 'Rendered view includes correct placeholder text' do
    get users_path
    expect(response.body).to include('Users index view')
  end
end
