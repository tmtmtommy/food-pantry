class VegetablesController < ApplicationController
  before_action :authenticate_user!

  def index
    @vegetables = Vegetable.order(:name)
  end
end
