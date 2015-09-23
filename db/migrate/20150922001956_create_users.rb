# Creating variables and automatically generating the database schemma to User Class

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :user_id
    	t.string :username
    	t.string :email
    	t.boolean :is_admin
    	t.timestamps null: false
    	t.string :provider
    end
  end
end
