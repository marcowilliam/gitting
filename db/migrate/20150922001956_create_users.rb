# Creating variables and automatically generating the database schemma to User Class

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :email
    	t.timestamps null: false
    end
  end
end
