class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
    render :index
  end
  
  def new
    @gallery = Gallery.new
    render :new
  end

  def create
    @gallery.create(gallery_params)

    redirect_to root_path 
  end

  def update
    gallery = load_gallery_from_url
    gallery.update(gallery_params)

    redirect_to root_path
  end

  def show
    @gallery = load_gallery_from_url
  end

  def edit
    @gallery = load_gallery_from_url
  end

  def destroy
    gallery = load_gallery_from_url
    gallery.destroy

    redirect_to root_path
  end

  def load_gallery_from_url
    Gallery.find(params[:id])
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
end
