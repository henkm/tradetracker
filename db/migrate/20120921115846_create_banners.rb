class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.integer :affiliate_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
