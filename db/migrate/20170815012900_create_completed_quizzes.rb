class CreateCompletedQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :completed_quizzes do |t|
      t.integer :quiz_id, null: false
      t.integer :user_id, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end
