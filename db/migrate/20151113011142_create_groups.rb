class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :discipline
      t.string :project_name
      t.string :project_description
      t.string :repository_name
      t.string :repository_owner
      t.timestamps null: false
    end
  end
end
