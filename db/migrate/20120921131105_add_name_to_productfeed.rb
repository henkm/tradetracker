class AddNameToProductfeed < ActiveRecord::Migration
  def change
    add_column :productfeeds, :name, :string
  end
end
