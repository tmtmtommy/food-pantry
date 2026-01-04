class StocksController < ApplicationController
  before_action :authenticate_user! # 在庫一覧をログイン必須にする

  def index
    @stocks = current_user.stocks.includes(:vegetable).order(purchased_on: :asc, created_at: :asc)
  end

  def new
    @stock = Stock.new(purchased_on: Date.current)
    @stock.mode = "master"  # 初期値
    @vegetables = Vegetable.order(:name)
  end

  def create
    @stock = current_user.stocks.new(stock_params)
    @stock.mode = params.dig(:stock, :mode) # 失敗時に保持
    @vegetables = Vegetable.order(:name)

    if @stock.save
      redirect_to stocks_path, notice: "在庫を登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    stock = current_user.stocks.find(params[:id])
    stock.destroy!
    redirect_to stocks_path, notice: "使い切った"
  end

  private

  def stock_params
    params.require(:stock).permit(:vegetable_id, :custom_name, :purchased_on)
  end

end
