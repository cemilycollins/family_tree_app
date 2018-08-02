class PartnershipsController < ApplicationController

  before_action :person, only: [:new, :create]
  before_action :partnership, only: [:edit, :update, :destroy]

  def edit
    @person = @partnership.person
  end

  def update
    @person = @partnership.person
    if @partnership.update(partnership_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def new
    @partnership = @person.partnerships.build
  end

  def create
    @partnership = @person.partnerships.build(partnership_params)
    if @partnership.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def partnership_params
    params.require(:partnership).permit(:name, :percentage)
  end

  def person
    @person = Person.find(params[:person_id])
  end

  def partnership
    @partnership = Partnership.find(params[:id])
  end

  def check_authentication
    if !user_is_signed_in
      flash[:alert] = "you need to sign in to view that"
      redirect_to sign_in_path
    end
  end

  def user_is_signed_in
    @user = User.find(session[:user_id])
    if params[:person_id]
      @person = Person.find(params[:person_id])
    elsif params[:id]
      @partnership = Partnership.find(params[:id])
      @person = @partnership.person
    end
    if params[:user_id]
      session[:user_id] == params[:user_id].to_i
    elsif params[:person_id] || params[:id]
      @user.family == @person.family
    else
      @user = User.find(session[:user_id])
    end
  end

end
