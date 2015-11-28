class AddPermalinkToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :permalink, :string
    add_index :presentations, :permalink
  end
  def self.down
    remove_column :presentations, :permalink
  end
end