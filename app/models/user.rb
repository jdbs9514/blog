class User < ApplicationRecord
  has_many :post
  has_many :likes
  has_many :comments

  def last_3_post
    post.last(3)
  end
end
