class ChangeColumnNameFromAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :flag, :body
  end
end
