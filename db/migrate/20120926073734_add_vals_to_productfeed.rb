class AddValsToProductfeed < ActiveRecord::Migration
  def change
    add_column :productfeeds, :extra_info1_value, :string
    add_column :productfeeds, :extra_info2_value, :string
    add_column :productfeeds, :extra_info3_value, :string
  end
end
