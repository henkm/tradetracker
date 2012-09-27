class Banner < ActiveRecord::Base
  attr_accessible :affiliate_id, :name, :productfeed_ids, :style, :custom_css, :show_image, :max_text_size
  validates :affiliate_id, presence: true
  belongs_to :affiliate
  validates :name, presence: true
  has_many :banner_productfeeds
  has_many :productfeeds, through: :banner_productfeeds
  has_many :products, through: :productfeeds
  
  # def productfeed_ids
  #   banner_productfeeds.map(&:productfeed_id)
  # end
  
  def self.styles
    {
      leaderboard: {name: "leaderboard", width: 728, height: 90, per_page: 3}, 
      large_rectangle: {name: "large rectangle", width: 336, height: 280, per_page: 3},
      medium_rectangle: {name: "medium rectangle", width: 300, height: 250, per_page: 2},
      wide_skyscraper: {name: "wide skyscraper", width: 160, height: 600, per_page: 3},
      skyscraper: {name: "skyscraper", width: 120, height: 600, per_page: 1}
    }
  end
end
