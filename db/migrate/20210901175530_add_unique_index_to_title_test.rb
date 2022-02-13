class AddUniqueIndexToTitleTest < ActiveRecord::Migration[5.2]
  def up
    add_index :tests, [:title, :level], unique: true
  end

  def down
    remove_index :tests, :title
  end
end
