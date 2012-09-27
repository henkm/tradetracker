class AddUpdateVersionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :update_version, :string
    add_column :productfeeds, :update_version, :string
    add_index :products, [:productfeed_id, :update_version]
  end
end
