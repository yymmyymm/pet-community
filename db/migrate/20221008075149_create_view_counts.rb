class CreateViewCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :view_counts do |t|
      t.integer :book_post_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
