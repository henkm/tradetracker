class AffiliatesController < ApplicationController
  def index
    @affiliates = Affiliate.all
  end

  def show
    @affiliate = Affiliate.find(params[:id])
  end

  def new
    @affiliate = Affiliate.new
  end

  def create
    @affiliate = Affiliate.new(params[:affiliate])
    if @affiliate.save
      redirect_to @affiliate, :notice => "Successfully created affiliate."
    else
      render :action => 'new'
    end
  end

  def edit
    @affiliate = Affiliate.find(params[:id])
  end

  def update
    @affiliate = Affiliate.find(params[:id])
    if @affiliate.update_attributes(params[:affiliate])
      redirect_to @affiliate, :notice  => "Successfully updated affiliate."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @affiliate = Affiliate.find(params[:id])
    @affiliate.destroy
    redirect_to affiliates_url, :notice => "Successfully destroyed affiliate."
  end
end
