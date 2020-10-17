class PetAppsReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :pet_apps, :pets, foreign_key: true
    add_reference :pet_apps, :apps, foreign_key: true
  end
end
