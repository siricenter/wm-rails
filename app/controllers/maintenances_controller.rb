class MaintenancesController < ApplicationController
    before_action :authenticate_admin!, except: [:new, :create, :created]
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

  # GET /maintenances
  # GET /maintenances.json
  def index
    @maintenances = Maintenance.all
    @buildings = Building.all
  end

  # GET /maintenances/1
  # GET /maintenances/1.json
  def show
    @buildings = Building.all
  end

  # GET /maintenances/new
  def new
    @maintenance = Maintenance.new
    @buildings = Building.all
  end

  # GET /maintenances/1/edit
  def edit
    @buildings = Building.all
  end

  # POST /maintenances
  # POST /maintenances.json
  def create
    @maintenance = Maintenance.new(maintenance_params)
    @buildings = Building.all
    respond_to do |format|
      if @maintenance.save
          if admin_signed_in?
          	format.html { redirect_to @maintenance, notice: 'Maintenance was successfully created.' }
            format.json { render :show, status: :created, location: @maintenance}
          else
              format.html { redirect_to maintenances_created_path, notice: 'Maintenance was successfully created.' }
          	format.json { render :new, status: :created, location: maintenances_created_path}
          end
      else
        format.html { render :new }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1
  # PATCH/PUT /maintenances/1.json
  def update
    @buildings = Building.all
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance }
      else
        format.html { render :edit }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    @buildings = Building.all
    @maintenance.destroy
    respond_to do |format|
      format.html { redirect_to maintenances_url, notice: 'Maintenance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @buildings = Building.all
      @maintenance = Maintenance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_params
      params.require(:maintenance).permit(:tenant_name, :building_id, :location, :description, :tenant_phone)
    end
end
