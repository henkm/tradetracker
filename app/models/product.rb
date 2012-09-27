class Product < ActiveRecord::Base
  attr_accessible :byline, :description, :dna, :image, :new_price, :old_price, :productfeed_id, :title, :url
  belongs_to :productfeed
  validates :title, presence: true
  validates :description, presence: true
  
  # searchable do
  #   text :title, boost: 5, stored: true
  #   text :description, stored: true
  #   text :byline, stored: true
  #   integer :new_price
  #   integer :old_price
  #   integer :productfeed_id
  #   string :extra_info1
  #   string :extra_info2
  #   string :extra_info3
  # end
  
  def extras
    e = []
    [extra_info1, extra_info2, extra_info3].each do |extra|
      e << extra if extra.present?
    end
    e.join(', ')
  end
end
