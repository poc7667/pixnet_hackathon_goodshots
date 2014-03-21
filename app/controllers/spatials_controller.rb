class SpatialsController < ApplicationController
  before_action :set_spatial, only: [:show, :edit, :update, :destroy]

  # GET /spatials
  # GET /spatials.json
  def index
    @spatials = Spatial.all
    binding.pry
  end

  # GET /spatials/1
  # GET /spatials/1.json
  def show
  end

  # GET /spatials/new
  def new
    @spatial = Spatial.new
  end

  # GET /spatials/1/edit
  def edit
  end

  # POST /spatials
  # POST /spatials.json
  def create
    @spatial = Spatial.new(spatial_params)

    respond_to do |format|
      if @spatial.save
        format.html { redirect_to @spatial, notice: 'Spatial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @spatial }
      else
        format.html { render action: 'new' }
        format.json { render json: @spatial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spatials/1
  # PATCH/PUT /spatials/1.json
  def update
    respond_to do |format|
      if @spatial.update(spatial_params)
        format.html { redirect_to @spatial, notice: 'Spatial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @spatial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spatials/1
  # DELETE /spatials/1.json
  def destroy
    @spatial.destroy
    respond_to do |format|
      format.html { redirect_to spatials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spatial
      @spatial = Spatial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spatial_params
      params.require(:spatial).permit(:shap1, :shp2, :path, :lonlat, :lon, :lat)
    end
end
