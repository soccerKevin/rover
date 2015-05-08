class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|
    	t.integer :rating
    	t.string :dogs
    	t.text :review
    	t.date :start_date
    	t.date :end_date
      t.integer :sitter_id

      t.timestamps null: false
    end
  end
end
