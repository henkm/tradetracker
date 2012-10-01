env :PATH, ENV['PATH']
task update_products: :environment do
  require 'open-uri'
  Productfeed.all.each do |feed|
    feed.update_products
  end
end
