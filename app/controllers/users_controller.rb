class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		# @user_ads = @user.ads.all
		@ads = @user.ads.all.paginate(page: params[:page], per_page: 5).order('created_at DESC')
	end
end
