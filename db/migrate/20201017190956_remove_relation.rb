class RemoveRelation < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :apps
  end
end
