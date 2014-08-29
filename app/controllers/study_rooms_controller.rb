class StudyRoomsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_study_room, only: [:show, :edit, :update, :destroy]

  # GET /study_rooms
  # GET /study_rooms.json
  def index
    @study_rooms = StudyRoom.all
  end

  # GET /study_rooms/1
  # GET /study_rooms/1.json
  def show
  end

  # GET /study_rooms/new
  def new
    @study_room = StudyRoom.new
    @buildings = Building.all
  end

  # GET /study_rooms/1/edit
  def edit
  end

  # POST /study_rooms
  # POST /study_rooms.json
  def create
    @study_room = StudyRoom.new(study_room_params)

    respond_to do |format|
      if @study_room.save
        format.html { redirect_to @study_room, notice: 'Study room was successfully created.' }
        format.json { render :show, status: :created, location: @study_room }
      else
        format.html { render :new }
        format.json { render json: @study_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_rooms/1
  # PATCH/PUT /study_rooms/1.json
  def update
    respond_to do |format|
      if @study_room.update(study_room_params)
        format.html { redirect_to @study_room, notice: 'Study room was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_room }
      else
        format.html { render :edit }
        format.json { render json: @study_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_rooms/1
  # DELETE /study_rooms/1.json
  def destroy
    @study_room.destroy
    respond_to do |format|
      format.html { redirect_to study_rooms_url, notice: 'Study room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_room
      @study_room = StudyRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_room_params
      params.require(:study_room).permit(:building_id, :rm_type, :rm_number, :floor)
    end
end
