class PhotosController < ApplicationController
  def index
    @family = Family.find(params[:family_id])
    @photos = @family.photos
  end

  def show
    @family = Family.find(params[:family_id])
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @family = Family.find(params[:family_id])
    @photo = Photo.create(photo_params)
    if @photo.valid?
      @photo.save
      redirect_to family_photos_path(@family)
    else
      render :new
    end
  end

private

  def photo_params
    params.require(:photo).permit(:name, :img_url, :family_id)
  end

end
