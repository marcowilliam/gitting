class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :project_name
      t.string :project_description
      t.string :source
      t.index [:discipline_id], unique: true
      t.index :user_id
      t.timestamps null: false
    end
  end
end
