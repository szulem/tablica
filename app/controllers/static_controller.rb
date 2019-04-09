class StaticController < ApplicationController
  def home
  	@ads = Ad.all.order("created_at DESC")
  end
end
