class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :repository_name
      t.string :repository_language
      t.timestamps null: false
    end
  end
end
