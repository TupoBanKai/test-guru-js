class ChangeColumnTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :test_passages, :questions, column: :current_question_id
  end
end
