class EthnicitiesController < ApplicationController

  validates :percentage, numericality: true {maximum: 100}

  before_action :person, only: [:new, :create]
  before_action :ethnicity, only: [:edit, :update, :destroy]

  def edit
    if @ethnicity.update(ethnicity_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def update

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
  end

  private

  def ethnicity_params
    params.require(:ethnicity).permit(:type, :percentage)
  end

  def person
    @person = Person.find(params[:person_id])
  end

  def ethnicity
    @ethnicity = Ethnicity.find(params[:id])
  end

end
