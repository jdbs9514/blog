class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_like_counter

  def update_like_counter
    post.increment!(:likes_count)
  end

  private :update_like_counter
end
