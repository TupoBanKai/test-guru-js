class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|

      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.integer :correct_questions, default: 0
      t.references :current_question, default: 0, null: false

      t.timestamps
    end
  end
end
