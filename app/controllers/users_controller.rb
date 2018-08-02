class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :passwords)
  end

  def set_user
    @user = User.find(session[:user_id])
  end

end
