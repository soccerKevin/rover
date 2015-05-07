class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|

      t.timestamps null: false
    end
  end
end
