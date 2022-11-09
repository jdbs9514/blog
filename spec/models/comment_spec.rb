require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Test Comment comments_counter method' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, user_id: first_user.id, title: 'Hello', text: 'This is my first post')

    Comment.create(post: first_post, author: first_user, user_id: first_user.id, text: 'Hello there!')

    it 'first_post.comments_counter should equal 1' do
      expect(first_post.comments_counter).to eq(1)
    end
  end
end
