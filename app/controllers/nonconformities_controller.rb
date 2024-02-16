class NonconformitiesController < ApplicationController
  before_action :set_nonconformity, only: %i[ show edit update destroy ]

  # GET /nonconformities or /nonconformities.json
  def index
    @nonconformities = Nonconformity.all
  end

  # GET /nonconformities/1 or /nonconformities/1.json
  def show
  end

  # GET /nonconformities/new
  def new
    @nonconformity = Nonconformity.new
  end

  # GET /nonconformities/1/edit
  def edit
  end

  # POST /nonconformities or /nonconformities.json
  def create
    @nonconformity = Nonconformity.new(nonconformity_params)

    respond_to do |format|
      if @nonconformity.save
        format.html { redirect_to nonconformity_url(@nonconformity), notice: "Nonconformity was successfully created." }
        format.json { render :show, status: :created, location: @nonconformity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nonconformity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nonconformities/1 or /nonconformities/1.json
  def update
    respond_to do |format|
      if @nonconformity.update(nonconformity_params)
        format.html { redirect_to nonconformity_url(@nonconformity), notice: "Nonconformity was successfully updated." }
        format.json { render :show, status: :ok, location: @nonconformity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nonconformity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nonconformities/1 or /nonconformities/1.json
  def destroy
    @nonconformity.destroy

    respond_to do |format|
      format.html { redirect_to nonconformities_url, notice: "Nonconformity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nonconformity
      @nonconformity = Nonconformity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nonconformity_params
      params.require(:nonconformity).permit(:vehicle_id, :vehicleParts_id, :nonconformityTypes_id, :nonconformityLevels_id, :quadrants_id, :measures_id, :nonconformityLocals_id)
    end
end
