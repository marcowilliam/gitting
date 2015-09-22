# Creating variables and automatically generating the database schemma to Rating Class


class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
    	t.decimal :rating_value
    	t.text :rating_coment
    	t.string :rating_date
    	t.timestamps null: false
    end
  end
end
