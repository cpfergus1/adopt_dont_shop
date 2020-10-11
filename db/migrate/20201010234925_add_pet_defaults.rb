class AddPetDefaults < ActiveRecord::Migration[5.2]
  def change
      change_column :pets, :name, :string, :default => "Not Provided"
      change_column :pets, :age, :integer, :default => "Not Provided"
      change_column :pets, :description, :string, :default => "Not Provided"
      change_column :pets, :sex, :string, :default => "Not Provided"
      change_column :pets, :image, :string, :default => "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Comic_image_missing.svg/1200px-Comic_image_missing.svg.png"
  end
end
