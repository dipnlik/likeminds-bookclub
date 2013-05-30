class AddIndexes < ActiveRecord::Migration
  def up
    add_index :ratings, :book_id
    add_index :ratings, :user_id
  end

  def down
    remove_index :ratings, :book_id
    remove_index :ratings, :user_id
  end
end
