class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_authentication, only: [:new, :create]

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
    render :layout => false
  end

  def create
    if Person.find_by(first_name: user_params[:first_name], last_name: user_params[:last_name])
      @person = Person.find_by(first_name: user_params[:first_name], last_name: user_params[:last_name])
      @user = User.new(user_params)
      @user.person = @person
    else
      @user = User.new(user_params)
    end
    if @user.save
      redirect_to sign_in_path
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
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password)
  end

  def set_user
    @user = User.find(session[:user_id])
  end

end
