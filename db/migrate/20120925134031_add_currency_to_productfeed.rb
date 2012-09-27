class AddCurrencyToProductfeed < ActiveRecord::Migration
  def change
    add_column :productfeeds, :currency_field, :string
    add_column :productfeeds, :currency_attribute, :string
  end
end
