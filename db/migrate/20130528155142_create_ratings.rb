class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :book_id
      t.float :value, default: 0.0

      t.timestamps
    end
  end
end
