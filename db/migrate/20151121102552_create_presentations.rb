class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.text :title, default: ""
      t.references :user, index: true
      
      t.timestamps null: false
    end
    
    add_column :posts, :presentation_id, :integer
  end
end
