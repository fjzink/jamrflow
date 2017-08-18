class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.integer :question_id
      t.integer :answerer_id
      t.boolean :best_answer, default: false
      t.timestamps
    end
  end
end
