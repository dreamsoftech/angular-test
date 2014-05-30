class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :name
    	t.string :description
    	t.string :category
    	t.boolean :active
    	
      t.timestamps
    end
  end
end
