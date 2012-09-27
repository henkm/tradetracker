class BannerProductfeed < ActiveRecord::Base
  attr_accessible :banner_id, :productfeed_id
  belongs_to :banner
  belongs_to :productfeed
end
