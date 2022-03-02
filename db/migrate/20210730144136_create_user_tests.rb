# frozen_string_literal: true

class CreateUserTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.string :result, null: false, default: 'Not passed'

      t.timestamps
    end
  end
end
