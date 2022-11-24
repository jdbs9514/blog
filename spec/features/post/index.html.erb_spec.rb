require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  describe 'test' do
    before :each do
      # @user = User.create(name: 'Tom', bio: 'Teacher from Mexico.', photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
      # @id = @user.id
      # @first_post = Post.create(user_id: @user, title: 'Hello', text: 'Make a new comment on this post')
      # @second_post = Post.create(user_id: @user, title: 'hello', text: 'Make a new comment on this post')
      # @comment = Comment.create(post_id: @second_post, author: @user, text: ' hello world!')
      visit '/users/83/posts'
    end

    it 'show the username' do
      expect(page).to have_content('Tom')
    end

    it 'show the title' do
      expect(page).to have_content('Post information')
    end

    it 'show the user photo' do
      expect(page.body).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'show the number of post' do
      expect(page.body).to have_content('Number of post: 1')
    end

    it 'show the post title' do
      expect(page).to have_content('Hello')
    end

    it 'show the number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    it 'show the number of likes' do
      expect(page).to have_content('Likes: 0')
    end

    it 'test the pagination button' do
      expect(page.body).to have_content('Pagination')
    end
  end
end
