require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'index page' do
    before :each do
      visit '/users'
    end

    it 'shows the username Tommy' do
      expect(page).to have_content('Tommy')
    end

    it 'shows the profile picture of Tommy' do
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
