class AddUserToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
    add_index :posts, [:user_id, :created_at]
  end
end