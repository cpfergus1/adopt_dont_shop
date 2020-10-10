class AddDetailsToPets < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :status, :string, :default => "Available"
    add_reference :pets, :shelter, foreign_key: true
  end
end
