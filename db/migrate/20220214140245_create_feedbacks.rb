class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :body, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
