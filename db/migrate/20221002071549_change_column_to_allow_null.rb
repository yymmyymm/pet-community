class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :customers, :pet_name,:string, null: true # null: trueを明示する必要がある
    change_column :customers, :post_code,:string, null: true
    change_column :customers, :address,:string, null: true
    change_column :customers, :phone,:string, null: true
    change_column :customers, :introduce,:string, null: true
    
  end

  def down
    change_column :customers, :pet_name,:string, null: false
    change_column :customers, :post_code,:string, null: true
    change_column :customers, :address,:string, null: true
    change_column :customers, :phone,:string, null: true
    change_column :customers, :introduce,:string, null: true
    
  end
end
