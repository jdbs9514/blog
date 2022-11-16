require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end
  end

  it 'Renders the index view' do
    get '/users/:user_id/posts'
    expect(response).to render_template(:index)
  end

  it 'Renders template with correct text' do
    get '/users'
    expect(response.body).to include('Users index view')
  end
end
