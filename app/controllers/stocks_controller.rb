class StocksController < ApplicationController
  before_action :authenticate_user! # 在庫一覧をログイン必須にする

  def index
  end

  def new
    @stock = Stock.new
  end

end
