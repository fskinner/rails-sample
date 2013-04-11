class UsersController < ApplicationController

  def new
    if user_signed_in?
      redirect_to root_url
    else
      @user = User.new
    end
  end

  def create
    if user_signed_in?
      redirect_to root_url
    else
      @user = User.new params[:user]
      if @user.save
        sign_in @user
        redirect_to root_url
      else
        render 'new'
      end
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

end