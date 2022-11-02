class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :quizze, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
