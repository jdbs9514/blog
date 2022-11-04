class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user
  after_create :update_counter

  def update_counter
    if user.post_counter
      user.post_counter += 1
    else
      user.post_counter = 1
    end
    user.save
  end

  def recent_comments
    comments.limit(5).order(created_at(:desc))
  end
end
