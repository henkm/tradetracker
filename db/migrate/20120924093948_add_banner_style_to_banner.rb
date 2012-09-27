class AddBannerStyleToBanner < ActiveRecord::Migration
  def change
    add_column :banners, :style, :string
    add_column :banners, :custom_css, :text
    add_column :banners, :show_image, :boolean
    add_column :banners, :max_text_size, :integer
  end
end
