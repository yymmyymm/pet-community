class CreateGroupMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_members do |t|
      t.integer :customer_id
      t.integer :group_id

      t.timestamps
    end
  end
end
