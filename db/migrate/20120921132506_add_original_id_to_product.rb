class AddOriginalIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :original_id, :integer
    add_index :products, :original_id
    add_column :products, :extra_info1, :string
    add_column :products, :extra_info2, :string
    add_column :products, :extra_info3, :string
  end
end
