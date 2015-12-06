class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
    	t.belongs_to :group, index: true
    	t.string :repository_name
    	t.string :owner_name
    	t.timestamps null: false
    end
  end
end
