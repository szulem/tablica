class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@user_ads = @user.ads.all
	end
end
