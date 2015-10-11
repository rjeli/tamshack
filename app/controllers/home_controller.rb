class HomeController < ApplicationController
  def index
    redirect_to '/events' if user_signed_in?
  end
end
