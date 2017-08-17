class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :value
      t.string :votable_type
      t.integer :votable_id
      t.integer :voter_id
      t.timestamps
    end
  end
end
