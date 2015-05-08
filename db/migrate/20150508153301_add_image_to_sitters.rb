class AddImageToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :image, :string
  end
end
