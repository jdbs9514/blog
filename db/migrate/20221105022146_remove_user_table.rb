class RemoveUserTable < ActiveRecord::Migration[7.0]
  def change
    remove_column  :posts, :users_id
    remove_column  :comments, :users_id
    remove_column  :likes, :users_id
  end
end
