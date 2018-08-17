class RelationshipsController < ApplicationController

  before_action :person, only: [:new, :create]
  before_action :relationship, only: [:edit, :update, :destroy]

  def edit

  end

  def update
    if @relationship.update(relationship_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def destroy
    @family = Family.find(@relationship.child.family_id)
    @relationship.destroy
    redirect_to family_people_path(@family)
  end

  private

  def relationship_params
    params.require(:relationship).permit(:child_id, :parent_id, :blood_related)
  end

  def person
    @person = Person.find(params[:person_id])
  end

  def relationship
    @relationship = Relationship.find(params[:id])
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
      @relationship = Relationship.find(params[:id])
      @person = @user.person
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
