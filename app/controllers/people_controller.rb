class PeopleController < ApplicationController
  before_action :person, only: [:show, :edit, :update, :destroy]
  before_action :family, only: [:new, :create, :index]

  def index
    @people = @family.people
  end

  def show
    @family = @person.family
  end

  def new
    @person = @family.people.build
  end

  def create
    @person = @family.people.build(person_params)
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
    redirect_to family_people_path(@family)
  end

private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :dob, :dod, :deceased, :gender, :place_of_birth, :current_location)
  end

  def person
    @person = Person.find(params[:id])
  end

  def family
    @family = Family.find(params[:family_id])
  end

end
