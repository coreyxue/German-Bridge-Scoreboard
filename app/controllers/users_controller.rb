class UsersController < ApplicationController
include UsersHelper
  def index
    if History.last!=nil and History.last.end!=true
      @users = History.last.users
    else 
      @users = []
    end
  end

  def new
    if not start_recording?
      session[:history] = 'on'
      his = History.create(:on=>Date.today)
      session[:history_id] = his.id
    end
    @users = History.last.users
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.history_id = session[:history_id]
    @user.total = 0;
    @user.save

    if session[:remember_token]==nil
      session[:remember_token] = "check!"
    end

    if params[:commit]=="Next"
      redirect_to new_user_path
    else
      redirect_to users_path
    end

  end

  def destroy
  end

  def update
  end

  def destroy_all
    #User.destroy_all
    #Score.destroy_all
    h= History.last
    h.end = true
    h.save
    reset_session
    redirect_to '/'
  end

  def re_session
    reset_session
    redirect_to '/'
  end

  def put_session
    if session[:remember_token]==nil
      session[:remember_token] = "check!"
    end
  end
end
