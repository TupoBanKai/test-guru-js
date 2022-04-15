class AddColumnToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time, :string
  end
end
