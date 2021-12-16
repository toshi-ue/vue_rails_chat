class AddIndexToLike < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, [:user_id, :message_id], unique: true
  end
end
