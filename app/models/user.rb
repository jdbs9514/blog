class User < ApplicationRecord
  has_many :post, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def last_three_posts
    post.last(3)
  end
end
