class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper
  # GET /images
  # GET /images.json


  def index
    t1 = Time.now
    binding.pry
    @founds = Image.nearby(0.5, 120.21194444444, 22.9825)
    t2 = Time.now
    msecs = time_diff_milli t1, t2
    ap(msecs)

    @hash = Gmaps4rails.build_markers(Image.first) do |location, marker|
      marker.lat location.lat
      marker.lng location.lon
    end

    @founds.each do |item|
      p item.lonlat
      p item.hits
    end

    @images = Image.all.paginate(:page => params[:page], :per_page => 20, :order => 'updated_at DESC')
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:month, :hour, :small_square, :square, :weather, :image_id, :size, :category, :thumb, :exif, :title, :tags, :location, :type, :medium, :description, :normal, :link, :user, :bigger, :hits, :uploaded_at, :url, :original, :large, :taken_at, :dimension, :focal_length, :date_taken, :aperture, :camera, :metering_mode, :iso_speed_ratings, :city)
    end
end
