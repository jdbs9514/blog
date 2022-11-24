require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'index page' do
    before :each do
      # @user = User.create(name: 'Tom', bio: 'Teacher from ENgland', photo: 'www.photo.com')
      visit users_path
    end

    it 'shows the username Tom' do
      expect(page).to have_content('Tom')
    end

    it 'shows the profile picture of Tom' do
      expect(page).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'shows the number of post' do
      expect(page.body).to include('Number of posts: 1')
    end

    it 'show the title' do
      expect(page.body).to have_content('Welcome to my Blog App')
    end
  end
end
