# File name :: discipline.rb
# Description :: Class Discipline is a model class
# to represent discipline, a users group created by admins

class Discipline < ActiveRecord::Base
  has_many :inscriptions
  has_many :groups
  belongs_to :user

  # Method responsible for finding all disciplines that the user searched, in the DB.
  def self.search(query)
    where('discipline_name like ?', "%#{query}%")
  end

  # Method to verificate if the user exist in database
  def is_registered?
    @is_registered = false
    @inscriptions = Inscription.where(discipline_id: id)

    for inscription in @inscriptions
      @is_registered = true if inscription.discipline_id == id
    end

    @is_registered
  end

  # Method to return all users registered
  def users_registered
    @inscriptions = Inscription.where(discipline_id: id)
    @list_of_users_registred = []

    for inscription in @inscriptions
      if inscription.discipline_id == id
        @list_of_users_registred << inscription.user_id
      end
    end
    @list_of_users_registred
  end
end
