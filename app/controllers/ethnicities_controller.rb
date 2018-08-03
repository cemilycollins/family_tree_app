class EthnicitiesController < ApplicationController

  before_action :person, only: [:new, :create]
  before_action :ethnicity, only: [:edit, :update, :destroy]

  def edit
    @person = @ethnicity.person
  end

  def update
    @person = @ethnicity.person
    if @ethnicity.update(ethnicity_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def new
    @ethnicity = @person.ethnicities.build
  end

  def create
    @ethnicity = @person.ethnicities.build(ethnicity_params)
    if @ethnicity.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def destroy
    @person = @ethnicity.person
    @ethnicity.destroy
    redirect_to person_path(@person)
  end

  private

  def ethnicity_params
    params.require(:ethnicity).permit(:name, :percentage)
  end

  def person
    @person = Person.find(params[:person_id])
  end

  def ethnicity
    @ethnicity = Ethnicity.find(params[:id])
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
      @ethnicity = Ethnicity.find(params[:id])
      @person = @ethnicity.person
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
