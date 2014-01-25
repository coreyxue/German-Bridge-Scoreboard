class HistoriesController < ApplicationController
  def index
  	@histories = History.all
  end

  def new
  	session[:history] = 'on'
  	History.create(:on=>Date.today)
  	redirect_to new_user_path
  end

  def create
  	History.create(:on=>Date.today)
  	redirect_to new_user_path
  end

  def show
  	@history = History.find(params[:id])
  end
end
