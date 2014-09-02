class HappeningsController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]
  before_action :set_happening, only: [:show, :edit, :update, :destroy]

  # GET /happenings
  # GET /happenings.json
  def index
    @happenings = Happening.all
  end

  # GET /happenings/1
  # GET /happenings/1.json
  def show
  end

  # GET /happenings/new
  def new
    @happening = Happening.new
  end

  # GET /happenings/1/edit
  def edit
  end

  # POST /happenings
  # POST /happenings.json
  def create
    @happening = Happening.new(happening_params)

    respond_to do |format|
      if @happening.save
        format.html { redirect_to @happening, notice: 'Happening was successfully created.' }
        format.json { render :show, status: :created, location: @happening }
      else
        format.html { render :new }
        format.json { render json: @happening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /happenings/1
  # PATCH/PUT /happenings/1.json
  def update
    respond_to do |format|
      if @happening.update(happening_params)
        format.html { redirect_to @happening, notice: 'Happening was successfully updated.' }
        format.json { render :show, status: :ok, location: @happening }
      else
        format.html { render :edit }
        format.json { render json: @happening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /happenings/1
  # DELETE /happenings/1.json
  def destroy
    @happening.destroy
    respond_to do |format|
      format.html { redirect_to happenings_url, notice: 'Happening was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_happening
      @happening = Happening.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def happening_params
      params.require(:happening).permit(:heading, :description, :date)
    end
end
