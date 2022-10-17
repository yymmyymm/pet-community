class RenameIsDeletedColumnToPostImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_images, :is_deleted, :is_deleted_post
  end
end
