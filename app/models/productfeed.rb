class Productfeed < ActiveRecord::Base
  has_many :products
  has_many :banner_productfeeds
  # attr_accessible :xml_url, :title_field, :description_field, :url_field, :link_text, :byline_field, :old_price_field, :new_price_field, :image_field
  

  def show_link_text
    if link_text.present? 
      link_text
    else
      "Kopen"
    end
  end
  
  # update the products in this feed
  def update_products(xml=nil)
    require 'open-uri'
    time_before_update = Time.zone.now.to_i
    update_column :update_version, time_before_update
    url = xml_url
    if Rails.env == 'development'
      url = url + "&limit=250"
    end
    if xml_url.present?
      xml = open(url).read unless xml.present?
      doc = Nokogiri::XML(xml)
      doc.xpath('//product').each do |item|      
        original_id = get_value(item, original_id_field, original_id_attribute)
        product = products.find_or_initialize_by_original_id(original_id)
        product.title = get_value(item, title_field)
        product.image = get_value(item, image_field, image_attribute, image_value)
        product.description = get_value(item, description_field)
        product.url = get_value(item, url_field, url_attribute)
        product.url = systemize_url(product.url)
        product.old_price = get_value(item, old_price_field, old_price_attribute)
        product.new_price = get_value(item, new_price_field, new_price_attribute)
        product.currency = get_value(item, currency_field, currency_attribute)
        [1,2,3].each do |i|
          val = get_extra_value(item, i)
          if send("extra_info#{i}_type") == "Datum"
            begin
              date = Date.parse(val) if val.present?
              val = I18n.l(date) if date
            rescue
              logger.info "invalid date"
            end
          end
          product["extra_info#{i}"] = val
        end
        product.update_version = time_before_update
        logger.info product.inspect
        unless product.title.present? && product.description.present?
          logger.info "Destroy product"
          product.destroy
        else
          logger.info "Saving product"
          product.save
        end

      end
    end
    logger.info "Destroying old products"
    products.where("update_version != '#{time_before_update}'").destroy_all
  end
  
  def get_extra_value(item, i)
    element = send("extra_info#{i}_field")
    att = self.send("extra_info#{i}_attribute")
    val = self.send("extra_info#{i}_value")
    returning_val = get_value(item, element, val) if element.present?
  end
  
  def get_value(item, element, att=nil, val=nil)
    logger.info "getting value for #{item}"
    logger.info "element: #{element}"
    logger.info "attribute: #{att}"
    
    if att.present?
      # begin
      if val.present?
        content = item.xpath("#{element}[@#{att}='#{val}']").text if item.xpath("#{element}[@#{att}='#{val}']")
      else
        content = item.xpath(element).attribute(att).text if item.xpath("#{element}").attribute(att)
      end
      logger.info "Content: #{content}"
      # item.xpath(element)[att.to_s] #.attr(att).text if item.xpath(element) && item.xpath(element).attr(att).text
      # item.xpath("#{element}[@name='#{att}']")
      content
      # rescue Exception => e
      #   logger.info e
      # end
    else
      item.xpath(element).text if element.present?
    end
  end
  
  def systemize_url(url)
    url.gsub(/(_|a=)(#{Affiliate.all.map{|a| a.tradetracker_id}.join('|')})/, "\\1[FIND_REPLACE_ID]")
  end
end
