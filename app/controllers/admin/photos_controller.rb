class Admin::PhotosController < ApplicationController
  before_action :authenticate_admin
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.includes(image_attachment: :blob).recent
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    if params[:photo][:images].present?
      # Bulk upload
      bulk_upload
    else
      # Single upload
      single_upload
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to admin_photo_path(@photo), notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to admin_photos_path, notice: 'Photo was successfully deleted.'
  end

  def bulk_upload_form
    # New route for bulk upload interface
  end

  private

  def authenticate_admin
    authenticate_or_request_with_http_basic("Admin Area") do |username, password|
      # Using environment variables for security
      # Set these in your deployment environment or .env file
      admin_username = ENV['ADMIN_USERNAME'] || 'admin'
      admin_password = ENV['ADMIN_PASSWORD'] || 'changeme123'

      username == admin_username && password == admin_password
    end
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def single_upload
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to admin_photos_path, notice: 'Photo was successfully uploaded.'
    else
      render :new
    end
  end

  def bulk_upload
    uploaded_files = params[:photo][:images]
    category = params[:photo][:category]
    taken_at = params[:photo][:taken_at].present? ? Date.parse(params[:photo][:taken_at]) : nil

    successful_uploads = 0
    failed_uploads = []

    uploaded_files.each do |file|
      next if file.blank?

      begin
        Photo.create_from_file(file, category: category, taken_at: taken_at)
        successful_uploads += 1
      rescue => e
        failed_uploads << "#{file.original_filename}: #{e.message}"
      end
    end

    if failed_uploads.empty?
      redirect_to admin_photos_path, notice: "Successfully uploaded #{successful_uploads} photos."
    else
      flash[:notice] = "Uploaded #{successful_uploads} photos successfully."
      flash[:alert] = "Failed uploads: #{failed_uploads.join(', ')}"
      redirect_to admin_photos_path
    end
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :category, :taken_at, :image)
  end

  def bulk_upload_params
    params.require(:photo).permit(:category, :taken_at, images: [])
  end
end
