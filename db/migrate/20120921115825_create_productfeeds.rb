class CreateProductfeeds < ActiveRecord::Migration
  def self.up
    create_table :productfeeds do |t|
      t.string :xml_url
      t.string :title_field
      t.string :description_field
      t.string :url_field
      t.string :link_text
      t.string :byline_field
      t.string :old_price_field
      t.string :new_price_field
      t.string :image_field
      t.timestamps
    end
  end

  def self.down
    drop_table :productfeeds
  end
end
