class ProductfeedsController < ApplicationController

  def update_feed
    Productfeed.find(params[:id]).update_products
    redirect_to :back
  end
  
  def example
    require 'open-uri'
    url = params[:url] + "&limit=1"
    begin 
      xml = open(url).read
      doc = Nokogiri::XML(xml)
      logger.info doc.xpath('//product').count
      @example =  doc.xpath('//product').first.to_s
    rescue
      @example = "Onjuiste URL opgegeven"
    end
  end
  
  def index
    @productfeeds = Productfeed.all
  end

  def show
    @productfeed = Productfeed.find(params[:id])
    @products = @productfeed.products.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @productfeed = Productfeed.new
  end

  def create
    @productfeed = Productfeed.new(params[:productfeed])
    if @productfeed.save
      redirect_to @productfeed, :notice => "Successfully created productfeed."
    else
      render :action => 'new'
    end
  end

  def edit
    @productfeed = Productfeed.find(params[:id])
  end

  def update
    @productfeed = Productfeed.find(params[:id])
    if @productfeed.update_attributes(params[:productfeed])
      redirect_to @productfeed, :notice  => "Successfully updated productfeed."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @productfeed = Productfeed.find(params[:id])
    @productfeed.destroy
    redirect_to productfeeds_url, :notice => "Successfully destroyed productfeed."
  end
end
