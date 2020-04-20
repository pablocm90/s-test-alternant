class CreateQuestions < ActiveRecord::Migration[5.1]

  def change
  
    create_table :questions do |t|

      t.string :question
      t.string :response1
      t.string :response2
      t.string :response3
      t.string :response4
      t.integer :answer

      t.timestamps
    end
    add_reference :questions, :quizz, index: true
    add_foreign_key :questions, :quizzs, column: :quizz_id, on_delete: :cascade


  end
end
