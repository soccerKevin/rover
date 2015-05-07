class CreateSitters < ActiveRecord::Migration
  def change
    create_table :sitters do |t|
    	t.string :name
    	t.integer :rank

      t.timestamps null: false
    end
  end
end
