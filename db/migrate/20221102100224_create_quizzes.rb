class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :score
      t.string :name
      t.timestamps
    end
  end
end
