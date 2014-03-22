class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper
  # GET /images
  # GET /images.json


  def index

    current_location = Image.nearby( 0.2, 121.52847610518472, 25.04476753094792).first
    @hash = Gmaps4rails.build_markers(current_location) do |location, marker|
      marker.lat 25.04476753094792
      marker.lng 121.52847610518472
    end

  end

  def get_day_night(params)
    ret_imgs = []
    @raw_images.each do |img|
      case params["day_night"].to_i
      when 1
        ap("day")
        ret_imgs << img if (img.hour >= 6 and img.hour <= 18)
      else
        ap("night")
        ret_imgs << img if (img.hour >= 19 and img.hour <= 24) or (img.hour >= 0 and img.hour <= 5)
      end
    end
    return ret_imgs
  end

  def search
    p = params
    t1 = Time.now


    @raw_images = Image.nearby( 2, p["q_lon"], p["q_lat"])
    .where(category: ['22', '11'])

    @raw_images = get_day_night(params)


    if params["weather"]
      @images = []
      @raw_images.each do |img|
        w_code = img.weather["weatherCode"].to_i

        case params["weather"]
        when "rain"
          @images << img  if [200,386,389,392,395,185,263,266,281,284,176,293,296,299,302,305,308,311,314,353,356,359,386,389].include? w_code
        when "sunny"
          @images << img  if [113].include? w_code
        when "cloudy"
          @images << img  if [119,112,116,143,248,260].include? w_code
        end
      end

    else
      @images = @raw_images
    end

    t2 = Time.now
    msecs = time_diff_milli t1, t2
    ap(msecs)
    #sun 113
    #couly 116,119,112,143,248,260
    #
    # ap(@images.to_json)
    # binding.pry
    ap(params)
    respond_to  do |format|
      format.js{ render :action => "search"}
      format.json{ render :json => @images.to_json }
    end

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
