require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  describe 'show page' do
    before :each do
      # @user = User.create(name: 'Tom', bio: 'Teacher from Mexico.', photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
      # @id = @user.id
      # Post.create(user_id: @user, title: 'Hello', text: 'Make a new comment on this post')
      # Post.create(user_id: @user, title: 'hello', text: 'Make a new comment on this post')
      visit '/users/83'
    end

    it 'show username' do
      expect(page).to have_content('Tom')
    end

    it 'show page title' do
      expect(page).to have_content('User information')
    end

    it 'show the user bio' do
      expect(page).to have_content('Teacher from Mexico')
    end

    it 'show the number of post' do
      expect(page.body).to include('Number of post: 1')
    end

    it 'test the see all post button' do
      expect(page).to have_content('See all post')
    end

    it 'test the create a new post' do
      click_link('Create a new post')
      expect(current_path).to have_content('/users/83/posts/new')
    end

    it 'test the Back to user list' do
      click_link('Back to users list')
      expect(current_path).to have_content('/users')
    end
  end
end
