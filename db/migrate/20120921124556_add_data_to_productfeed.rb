class AddDataToProductfeed < ActiveRecord::Migration
  def change
    add_column :productfeeds, :original_id_field, :string
    add_column :productfeeds, :original_id_attribute, :string
    add_column :productfeeds, :url_attribute, :string
    add_column :productfeeds, :byline_attribute, :string
    add_column :productfeeds, :old_price_attribute, :string
    add_column :productfeeds, :new_price_attribute, :string
    add_column :productfeeds, :image_attribute, :string
  end
end
