class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :customer_id, null: false
      t.integer :genre_id
      t.string :title, null: false
      t.text :caption
      t.boolean :is_deleted, null: false, default: false
      t.timestamps null: false
    end
  end
end
