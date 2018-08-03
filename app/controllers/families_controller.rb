class FamiliesController < ApplicationController

  # before_action :user

  def index
    @families = Family.all
  end

  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
    @photo = @family.photos.build(name: "family portrait")
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      @photo = @family.photos.build(name: params[:family][:photo][:name], img_url: params[:family][:photo][:img_url])
      @photo.save
      @user.person.family = @family
      @user.person.save
      redirect_to user_family_path(@user, @family)
    else
      render :new
    end
  end

private
  def family_params
    params.require(:family).permit(:name, :person_id, photo_attributes: [:name, :img_url])
  end

  def user
    @user = User.find(params[:user_id])
  end

  def user_is_signed_in
    @user = User.find(session[:user_id])
    if params[:id]
      @family = Family.find(params[:id])
    end
    if params[:user_id]
      session[:user_id] == params[:user_id].to_i
    elsif params[:person_id] || params[:id]
      @user.family == @family
    else
      @user = User.find(session[:user_id])
    end
  end

end
