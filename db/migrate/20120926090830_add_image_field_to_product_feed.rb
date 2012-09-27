class AddImageFieldToProductFeed < ActiveRecord::Migration
  def change
    add_column :productfeeds, :image_value, :string
  end
end
