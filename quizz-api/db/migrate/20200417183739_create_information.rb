class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.references :user, foreign_key: true
      t.references :quizz, foreign_key: true
      t.integer  :score
      t.timestamps
    end
  end
end
