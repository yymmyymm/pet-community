class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :customer_id, null: false
      t.integer :genre_id
      t.string :q_title, null: false
      t.text :q_caption
      t.boolean :is_deleted_q, null: false, default: false

      t.timestamps
    end
  end
end
