class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :followings, :follower_id, :followed_id

  	add_index :followings, [:user_id, :followed_id], unique: true
  end
end
