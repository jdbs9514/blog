require 'rails_helper'

RSpec.describe 'User page index', type: :feature do
  describe 'test' do
    before :each do
      @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 4)
      @second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', post_counter: 0)
      @id = @first_user.id
      @first_post = Post.create(author_id: @first_user, title: 'Hello', text: 'This is my first post')
      @second_post = Post.create(author_id: @first_user, title: 'Hello 2', text: 'This is my first post')
      @third_post = Post.create(author_id: @first_user, title: 'Hello 3', text: 'This is my third post')
      @fourth_post = Post.create(author_id: @first_user, title: 'Hello 4', text: 'This is my fourth post')
      visit users_path
    end

    it 'should show the title page' do
      expect(page).to have_content('Welcome to my Blog App')
    end

    it 'should show the users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'should show the user picture' do
      expect(page).to have_content(@first_user.photo)
      expect(page).to have_content(@second_user.photo)
    end

    it 'should show the number of post for each user' do 
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('Number of posts: 0')
    end

    it 'show the information for each user' do
      visit users_path
      click_link 'Tom'
      expect(current_path).to eq(user_path(@id))
    end
  end
end
