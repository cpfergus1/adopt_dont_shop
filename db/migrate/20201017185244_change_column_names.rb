class ChangeColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :pet_apps, :apps_id, :app_id
    rename_column :pet_apps, :pets_id, :pet_id
  end
end
