class User < ApplicationRecord
  has_many :post, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def last_three_posts
    post.last(3)
  end
end
