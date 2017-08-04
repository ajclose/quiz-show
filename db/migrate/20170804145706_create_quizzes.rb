class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
