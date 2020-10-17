class AddPetstoApps < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :pet_apps, foreign_key: true
    add_reference :apps, :pet_apps, foreign_key: true
    add_reference :users, :apps, foreign_key: true
  end
end
