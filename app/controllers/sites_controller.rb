class SitesController < ApplicationController
  before_filter :signed_in_user

  def show
    @site = Site.find(params[:id])
    @json = @site.to_gmaps4rails
  end

  def create
    @site = current_user.sites.build(params[:site])
    if @site.save
      flash[:success] = "Site created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end