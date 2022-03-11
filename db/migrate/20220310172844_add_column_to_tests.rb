class AddColumnToTests < ActiveRecord::Migration[5.2]
  def up
    add_column :tests, :status, :boolean, null: false, default: false
  end

  def down
    remove_column :tests, :status
  end
end
