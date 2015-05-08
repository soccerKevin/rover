class AddOwnerIdToStays < ActiveRecord::Migration
  def change
    add_column :stays, :owner_id, :integer
  end
end
