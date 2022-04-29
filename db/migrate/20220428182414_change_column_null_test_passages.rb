class ChangeColumnNullTestPassages < ActiveRecord::Migration[5.2]
  def change
    change_column_null :test_passages, :current_question_id, null: true
  end
end
