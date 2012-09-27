class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :byline
      t.string :image
      t.string :old_price
      t.string :new_price
      t.string :dna
      t.string :url
      t.text :description
      t.integer :productfeed_id

      t.timestamps
    end
    add_index :products, :productfeed_id
  end
end
