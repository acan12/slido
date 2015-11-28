class AddLikeesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :likees_count, :integer, default: 0
    add_column :presentations, :likers_count, :integer, default: 0
  end
end
