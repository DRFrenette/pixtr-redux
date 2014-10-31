class GalleriesController < ApplicationController

  def index
    @galleries = current_user.galleries.all
    render :index
  end
  
  def new
    @gallery = current_user.galleries.new
    render :new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)

    redirect_to root_path 
  end

  def update
    @gallery = load_personal_gallery_from_url
    gallery.update(gallery_params)

    redirect_to root_path
  end

  def show
    @gallery = load_gallery_from_url
  end

  def edit
    @gallery = load_personal_gallery_from_url
  end

  def destroy
    gallery = load_personal_gallery_from_url
    gallery.destroy

    redirect_to root_path
  end


  private

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end

  def load_gallery_from_url
    Gallery.find(params[:id])
  end

  def load_personal_gallery_from_url
    current_user.galleries.find(params[:id])
  end
end
