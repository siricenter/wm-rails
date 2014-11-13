class StudyReservationsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]
  before_action :set_study_reservation, only: [:show, :edit, :update, :destroy]

  # GET /study_reservations
  # GET /study_reservations.json
  def index
    @study_reservations = StudyReservation.all
  end

  # GET /study_reservations/1
  # GET /study_reservations/1.json
  def show
  end

  # GET /study_reservations/new
  def new
    @study_reservation = StudyReservation.new
    @study_rooms = StudyRoom.all
  end

  # GET /study_reservations/1/edit
  def edit
	  @study_reservation = StudyReservation.find(params[:id])
	  @study_rooms = StudyRoom.all
  end

  # POST /study_reservations
  # POST /study_reservations.json
  def create
    @study_reservation = StudyReservation.new(study_reservation_params)

    respond_to do |format|
      if @study_reservation.save
        format.html { redirect_to @study_reservation, notice: 'Study reservation was successfully created.' }
        format.json { render :show, status: :created, location: @study_reservation }
      else
        format.html { render :new }
        format.json { render json: @study_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_reservations/1
  # PATCH/PUT /study_reservations/1.json
  def update
    respond_to do |format|
      if @study_reservation.update(study_reservation_params)
        format.html { redirect_to @study_reservation, notice: 'Study reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_reservation }
      else
        format.html { render :edit }
        format.json { render json: @study_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_reservations/1
  # DELETE /study_reservations/1.json
  def destroy
    @study_reservation.destroy
    respond_to do |format|
      format.html { redirect_to study_reservations_url, notice: 'Study reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_reservation
      @study_reservation = StudyReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_reservation_params
      params.require(:study_reservation).permit(:study_room_id, :start, :stop, :date, :name)
    end
end
