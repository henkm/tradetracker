class BannersController < ApplicationController
  before_filter :authenticate, :except => ["style"]
  
  def index
    @banners = Banner.all
  end
  
  def style
    @banner = Banner.find(params[:id])
    @style = Banner.styles[(params[:style]).to_sym]
    render layout: "none"
  end
  
  def show
    @banner = Banner.find(params[:id])
    # @search = Product.search do
    #   fulltext params[:search] do
    #   highlight :title
    #   highlight :description
    #     # query_phrase_slop 0
    #   end
    #   with(:productfeed_id, Banner.find(params[:id]).productfeed_ids)
    #   paginate :page => params[:page], :per_page => 15
    #   
    #   # with(:published_at).less_than(Time.zone.now)
    #   # facet(:publish_month)
    #   # with(:publish_month, params[:month]) if params[:month].present?
    # end
    @products = @banner.products.order("rand()").paginate(:page => params[:page], :per_page => 15)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      redirect_to @banner, :notice => "Successfully created banner."
    else
      render :action => 'new'
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update_attributes(params[:banner])
      redirect_to @banner, :notice  => "Successfully updated banner."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy
    redirect_to banners_url, :notice => "Successfully destroyed banner."
  end
end
