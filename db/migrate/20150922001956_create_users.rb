# Creating variables and automatically generating the database schemma to User Class

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :email
        t.string :username
    	t.timestamps null: false
    end
  end

    def self.down
        drop_table :users
    end
end
