class AdsController < ApplicationController
  before_action :set_ad, only: %i[show edit update destroy]

  def index
  	@ads = Ad.all
  end

  def show
  	@ad = Ad.find(params[:id])
  end

  def new
  	@ad = Ad.new
  end

  def create
  	@ad = Ad.new(ad_params)
    if @ad.save
      redirect_to @ad, notice: "Your ad was successfully created."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ad.update(ad_params)
      redirect_to @ad, notice: "Your ad was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @ad.destroy
    redirect_to ads_path, notice: "Your visit was successfully destroyed."
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
  	params.require(:ad).permit(:title, :category, :description, :localization, :phone)
  end
end
