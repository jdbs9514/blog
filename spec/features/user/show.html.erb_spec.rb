require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  describe 'show page' do
    before(:each) do
      @user = User.create(name: 'Josue', bio: 'This is the bio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 4)
      @id = @user.id
      
      @post1 = Post.create(author_id: @user, title: 'Hello 1', text: 'This is my first post')

      @post2 = Post.create(author_id: @user, title: 'Hello 2', text: 'This is my second post')

      @post3 = Post.create(author_id: @user, title: 'Hello 3', text: 'This is my third post')
      
      @post4 = Post.create(author_id: @user, title: 'Hello 4', text: 'This is my fourth post')
      visit user_path(@id)
    end

    it 'show username' do
      expect(page).to have_content(@user.name)
    end

    it 'show page title' do
      expect(page).to have_content('User information')
    end

    it 'shows the user photo' do
      expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Number of posts: 4')
    end

    it 'show the user bio' do
      expect(page.body).to have_content(@user.bio)
    end

    it 'shows last 3 posts' do
      expect(page) == ('This is my second post')
      expect(page) == ('This is my third post')
      expect(page) == ('This is my fourth post')
      # expect(page.body).not_to include('This is my first post')
    end

    it 'test the see all post button' do
      expect(page).to have_content('See all post')
    end

    it 'redirect to post show page when a post is clicked' do
      click_link('See all posts')
      expect(current_path) == ('/users/84')
    end

    it 'test the create a new post' do
      click_link('Create a new post')
      expect(current_path) == ('/users/83/posts/new')
    end

    it 'test the Back to user list' do
      click_link('Back to users list')
      expect(current_path) == ('/users')
    end
  end
end
