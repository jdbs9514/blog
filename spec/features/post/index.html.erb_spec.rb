require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  describe 'test' do
    before :each do
      @user = User.create(name: 'Josue', bio: 'This is the bio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 4)
      @id = @user.id
      
      @post1 = Post.create(author_id: @user, title: 'Hello 1', text: 'This is my first post')

      @post2 = Post.create(author_id: @user, title: 'Hello 2', text: 'This is my second post')

      @post3 = Post.create(author_id: @user, title: 'Hello 3', text: 'This is my third post')
      
      @post4 = Post.create(author_id: @user, title: 'Hello 4', text: 'This is my fourth post', )

      @comment1 = Comment.create(post_id: @post4, author_id: @user, text: 'This is the 1st comment on the 4th post')
      visit user_posts_path(@user)
    end

    it 'show the username' do
      expect(page).to have_content(@user.name)
    end

    it 'show the title' do
      expect(page).to have_content('Post information')
    end

    it 'show the user photo' do
      expect(page.body).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'show the number of post' do
      expect(page.body).to have_content('Number of posts: 4')
    end

    it 'show the post title' do
      expect(page).to have_content('Hello 4')
    end

    it 'show the number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    # it 'show the number of likes' do
    #   expect(page).to have_content('Likes: 0')
    # end

    # it 'test the pagination button' do
    #   expect(page.body).to have_content('Pagination')
    # end
  end
end
