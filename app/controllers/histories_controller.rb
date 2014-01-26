class HistoriesController < ApplicationController
  def index
  	@histories = History.all
  end

  def new
    if History.last!=nil and History.last.end==true
    	session[:history] = 'on'
    	History.create(:on=>Date.today)
    end
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
