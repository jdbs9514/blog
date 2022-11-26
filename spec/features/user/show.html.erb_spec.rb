require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  describe 'test' do
    before  :each do
      @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 4)
      @second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', post_counter: 0)
      @id = @first_user.id
      @first_post = Post.create(author_id: @first_user.name, title: 'Hello', text: 'This is my first post')
      @second_post = Post.create(author_id: @first_user.name, title: 'Hello 2', text: 'This is my first post')
      @third_post = Post.create(author_id: @first_user.name, title: 'Hello 3', text: 'This is my third post')
      @fourth_post = Post.create(author_id: @first_user.name, title: 'Hello 4', text: 'This is my fourth post')
      visit user_path(@id)
    end

    it 'should show the user profile picture' do
      expect(page).to have_content(@first_user.photo)
    end
    
    it 'should show the user name' do
      expect(page).to have_content(@first_user.name)
    end

    it 'should show the number of posts' do
      expect(page).to have_content('Number of posts: 4')
    end

    it 'should show the bio of user' do
      expect(page).to have_content(@first_user.bio)
    end

    it 'should show the three first posts' do
      expect(page).to have_content(@fourth_post.author_id)
      expect(page).to have_content(@second_post.author_id)
      expect(page).to have_content(@third_post.author_id)
    end

    it 'should show the button page' do
      expect(page).to have_content('See all posts')
      expect(page).to have_content('Create a new post')
      expect(page).to have_content('Back to users list')
    end

    # it 'should redirect to the post information' do
    #   click_link 'Hello 2'
    #   expect(current_path).to eq('/users/1/posts/3')
    # end


  end
end
