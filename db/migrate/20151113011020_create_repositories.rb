class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      	t.references :group
    	t.string :repository_name
    	t.string :owner_name
    	t.timestamps null: false
    end
  end
end
