class AdsController < ApplicationController
  before_action :set_ad, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :ad_owner, only: %i[edit update destroy]
  before_action :set_all_categories_and_subcategories, only: [:new, :edit]

  def index
    @ads = Ad.all.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  def show
    @ad = Ad.find(params[:id])
    @user = @ad.user_id
  end

  def new
    @ad = Ad.new
  end

  def create
    # @ad = Ad.new(ad_params)
    @ad = current_user.ads.new(ad_params)
    if @ad.save
      redirect_to @ad, notice: "Your ad was successfully created."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # @ad.user_id = current_user.id
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
    params.require(:ad).permit(:title, :description, :localization, :phone, :price, :picture, :to_negotiation, :category_id, :subcategory_id, :user_id)
  end

  def ad_owner
    unless @ad.user_id == current_user.id
      flash[:alert] = 'Nie masz uprawnień do edycji tego ogłoszenia.'
      redirect_to root_path
    end
  end

  def set_all_categories_and_subcategories
    @categories = Category.all
    @subcategories = Subcategory.all
  end
end
