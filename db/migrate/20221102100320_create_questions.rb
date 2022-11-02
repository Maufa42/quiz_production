class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :op1
      t.string :op2
      t.string :op3
      t.string :op4
      t.string :answer
      t.references :quizze, null: false, foreign_key: true
      t.timestamps
    end
  end
end
