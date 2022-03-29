class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false, unique: true
      t.string :pic_name, null: false, unique: true
      t.string :rule, null: false
      t.timestamps
    end
  end
end
