class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update], if: -> { request.format.json? }
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
    respond_to do |format|
      format.html
      format.json { render json: @vehicles }
    end
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        create_nonconformity_for_vehicle(@vehicle) if params[:nonconformity].present?
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:location, :vehicleType, :chassis, :nonconformity, :model, :status, :ship, :situation, :observations,
      et_chassis: [], profile: [], front: [], back: [], right_side: [], left_side: [])
    end
    
    def create_nonconformity_for_vehicle(vehicle)
      nonconformities_params = params[:nonconformity]
      
      if nonconformities_params.is_a?(Array)
        nonconformities_params.each do |nonconformity_param|
          permitted_params = nonconformity_param.permit(:vehicleParts, :nonconformityTypes, :nonconformityLevels, :quadrants, :measures, :nonconformityLocals, file1: [], file2: [], file3: [], file4: []).merge(vehicle_id: vehicle.id)
          @nonconformity = Nonconformity.new(permitted_params)
          @nonconformity.save
        end
      else
        permitted_params = nonconformities_params.permit(:vehicleParts, :nonconformityTypes, :nonconformityLevels, :quadrants, :measures, :nonconformityLocals, file1: [], file2: [], file3: [], file4: []).merge(vehicle_id: vehicle.id)
        @nonconformity = Nonconformity.new(permitted_params)
        @nonconformity.save
      end
    end
    
    
end
