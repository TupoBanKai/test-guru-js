class AddColumnToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :value, :string
  end
end
