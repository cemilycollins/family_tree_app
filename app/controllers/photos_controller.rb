class PhotosController < ApplicationController
  before_action :photo, only: [:show, :edit, :update, :destroy]

  def index
    @family = Family.find(params[:family_id])
    @photos = @family.photos
  end

  def show
    @family = @photo.family
  end

  def new
    @photo = Photo.new(photo_type: "profile picture")
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.valid?
      @photo.save
      if params[:family_id]
        redirect_to user_family_photos_path(@user, @user.family)
      else
        redirect_to person_path(@photo.person)
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    @family = @photo.family
    @photo.destroy
    redirect_to family_photos_path(@family)
  end

private

  def photo_params
    params.require(:photo).permit(:name, :img_url, :family_id, :person_id, :photo_type)
  end

  def photo
    @photo = Photo.find(params[:id])
  end


end
