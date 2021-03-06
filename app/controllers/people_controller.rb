class PeopleController < ApplicationController
  before_action :person, only: [:show, :edit, :update, :destroy]
  before_action :family, only: [:index]

  def index
    @people = @family.people
  end

  def show
    @family = @person.family
  end

  def new
    if params[:family_id]
      @family = Family.find(params[:family_id])
      @person = @family.people.build
    else
      @person = Person.new
    end
  end

  def create
    if params[:family_id]
      @family = Family.find(params[:family_id])
      @person = @family.people.build(person_params)
    else

      @person = Person.new(person_params)
    end
    if @person.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def destroy
    @family = @person.family
    @person.destroy
    redirect_to user_path(@user)
  end

private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :dob, :dod, :deceased, :gender, :place_of_birth, :current_location, :user_id)
  end

  def person
    @person = Person.find(params[:id])
  end

  def family
    @family = Family.find(params[:family_id])
  end

  def check_authentication
    if !user_is_signed_in
      flash[:alert] = "you need to sign in to view that"
      redirect_to sign_in_path
    end
  end

  def user_is_signed_in
    @user = User.find(session[:user_id])
    if params[:id]
      @person = Person.find(params[:id])
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
