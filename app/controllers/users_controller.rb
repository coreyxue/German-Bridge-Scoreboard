class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.total = 0;
    @user.save

    if @user.admin
      session[:remember_token] = @user.id
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
    User.destroy_all
    Score.destroy_all
    reset_session
    redirect_to '/'
  end
end
