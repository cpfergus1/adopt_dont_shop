class CreateApplication < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :user_name
      t.string :user_address
      t.string :description
      t.string :pet_names
      t.string :status
    end
  end
end
