class AddCommentReferenceToPresentations < ActiveRecord::Migration
  def change
    add_reference :comments, :presentation, index: true
    remove_column :comments, :post_id
    
  end
end
