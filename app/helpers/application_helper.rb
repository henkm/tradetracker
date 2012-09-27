module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code, lexer: language)
      end
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
  
  def custom_url(url, banner=nil)
    if banner
      old_affiliate_code = url.split('_&r=').first.split('_').last
      url.gsub(old_affiliate_code.to_s, banner.affiliate.tradetracker_id.to_s)
      # http://www.concertgebouw.nl/kaarten/index.php?tt=8522_319827_40405_&r=http%3A%2F%2Fwww.concertgebouw.nl%2Fx%2F32185
      # http://www.concertgebouw.nl/kaarten/index.php?tt=8522_319827_481_&r=http%3A%2F%2Fwww.concertgebouw.nl%2Fx%2F26400
    else
      url
    end
  end
  
  def product_price(product)
    if product.currency.blank? || product.currency.downcase == "eur"
      cur = "&euro;"
    elsif product.currency.downcase == "usd"
      cur = "&usd;"
    end
    # if product.new_price.present?
      
    if product.old_price.present? && product.old_price.to_f.to_i > 0
      number_to_currency(product.old_price.to_f, :unit => cur, :separator => ",", :delimiter => "", :format => "%u %n")
    else
      product.productfeed.link_text
    end
  end
end
