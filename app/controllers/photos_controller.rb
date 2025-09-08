class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]

  def index
    @photos = Photo.includes(image_attachment: :blob)
                   .by_category(params[:category])
                   .recent
    @categories = Photo.CATEGORIES
    @current_category = params[:category]
  end

  def show
    @prev_photo = Photo.where('id < ?', @photo.id).order(id: :desc).first
    @next_photo = Photo.where('id > ?', @photo.id).order(id: :asc).first
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
