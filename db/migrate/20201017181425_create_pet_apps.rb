class CreatePetApps < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_apps do |t|

      t.timestamps
    end
  end
end
