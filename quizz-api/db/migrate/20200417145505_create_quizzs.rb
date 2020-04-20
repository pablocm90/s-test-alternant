class CreateQuizzs < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzs do |t|
      t.string :title

      t.timestamps
    end
  end
end
