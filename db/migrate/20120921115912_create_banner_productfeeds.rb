class CreateBannerProductfeeds < ActiveRecord::Migration
  def change
    create_table :banner_productfeeds do |t|
      t.integer :banner_id
      t.integer :productfeed_id

      t.timestamps
    end
    add_index :banner_productfeeds, :banner_id
    add_index :banner_productfeeds, :productfeed_id
  end
end
