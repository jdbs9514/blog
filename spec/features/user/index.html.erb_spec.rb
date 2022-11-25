require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Josue', bio: 'This is the bio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
      @id = @user.id
      Post.create(author_id: @user, title: 'Hello', text: 'This is my first post')
      visit users_path
    end

    it 'shows the users' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the profile picture for users' do
      expect(page).to have_content(@user.photo)
    end

    it 'shows the number of post' do
      expect(page.body).to include('Number of posts: 1')
    end

    it 'show the title' do
      expect(page.body).to have_content('Welcome to my Blog App')
    end
  end
end
