# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 1, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :creator_id, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
