class AddDetailsToPets < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :status, :string, :default => "Available"
  end
end
