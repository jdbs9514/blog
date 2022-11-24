require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  describe 'test' do
    before :each do
      # @user = User.create(name: 'Tommy', bio: 'Im from Perú', photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
      # @id = @user.id
      # @user2 = User.create(name: 'Tom', bio: 'Teacher from Mexico.', photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
      # @post = Post.create(user_id: @user, title: 'hello there', text: 'this is a prove')
      # @comment1 = Comment.create(post_id: @post4, author_id: @user2, text: 'This is the 1st comment on the 4th post')
      # visit user_posts_path(@user, @post)
      visit '/users/83/posts/74'
    end

    it 'show a post show page title' do
      expect(page.body).to have_content('Information for post')
    end

    it 'show a post title' do
      expect(page.body).to have_content('Hello')
    end

    it 'show an author name' do
      expect(page.body).to have_content('Tom')
    end

    it 'show number of comments' do
      expect(page.body).to have_content('Number of comments: 1')
    end

    it 'show the number of likes' do
      expect(page.body).to have_content('Number of likes: 0')
    end

    it 'has a text area to write a comment' do
      expect(page.body).to have_content('Enter your comment here')
    end

    it 'redirect to the post list' do
      click_link('Back to list of posts')
      expect(current_path).to eq('/users/83/posts')
    end
  end
end
