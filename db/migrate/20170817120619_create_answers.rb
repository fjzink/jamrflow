class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :question_id
      t.integer :answerer_id
      t.boolean :best_answer
      t.timestamps
    end
  end
end
