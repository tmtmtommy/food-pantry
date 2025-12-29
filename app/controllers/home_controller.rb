class HomeController < ApplicationController
  def top
    redirect_to stocks_path if user_signed_in?
  end
end
