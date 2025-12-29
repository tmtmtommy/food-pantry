class MypagesController < ApplicationController
  before_action :authenticate_user! # マイページをログイン必須にする

  def show
  end
end
