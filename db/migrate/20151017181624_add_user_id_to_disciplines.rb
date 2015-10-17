class AddUserIdToDisciplines < ActiveRecord::Migration
  def change
    add_reference :disciplines, :user, index: true, foreign_key: true
  end
end
