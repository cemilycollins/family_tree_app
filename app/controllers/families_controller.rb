class FamiliesController < ApplicationController

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
      redirect_to family_path(@family)
    else
      render :new
    end
  end


private
  def family_params
    params.require(:family).permit(:name, photo_attributes: [:name, :img_url])
  end

end
