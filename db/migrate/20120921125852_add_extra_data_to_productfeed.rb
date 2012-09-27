class AddExtraDataToProductfeed < ActiveRecord::Migration
  def change
    add_column :productfeeds, :extra_info1_field, :string
    add_column :productfeeds, :extra_info1_attribute, :string
    add_column :productfeeds, :extra_info2_field, :string
    add_column :productfeeds, :extra_info2_attribute, :string
    add_column :productfeeds, :extra_info1_name, :string
    add_column :productfeeds, :extra_info2_name, :string
    add_column :productfeeds, :extra_info1_type, :string
    add_column :productfeeds, :extra_info2_type, :string
    add_column :productfeeds, :extra_info3_field, :string
    add_column :productfeeds, :extra_info3_attribute, :string
    add_column :productfeeds, :extra_info3_name, :string
    add_column :productfeeds, :extra_info3_type, :string
  end
end
