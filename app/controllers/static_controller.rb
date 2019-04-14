class StaticController < ApplicationController
  def home
  	@ads = Ad.all.order("created_at DESC").limit(12)
  end
end
