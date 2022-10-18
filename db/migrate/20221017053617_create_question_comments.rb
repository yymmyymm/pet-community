class CreateQuestionComments < ActiveRecord::Migration[6.1]
  def change
    create_table :question_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :question_id

      t.timestamps
    end
  end
end
