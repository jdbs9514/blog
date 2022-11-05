class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_comment_counter

  def five_most_recent_comments
    Comment.last(5)
  end

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
