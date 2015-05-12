class CirculationsController < ApplicationController
  before_action :set_circulation, only: [:show, :edit, :update, :destroy]

  # GET /circulations
  # GET /circulations.json
  def index
    @circulations = Circulation.all
  end

  # GET /circulations/1
  # GET /circulations/1.json
  def show
  end

  # GET /circulations/new
  def new
    @circulation = Circulation.new
  end

  # GET /circulations/1/edit
  def edit
  end

  # POST /circulations
  # POST /circulations.json
  def create
    @circulation = Circulation.new(circulation_params)

    respond_to do |format|
      if @circulation.save
        format.html { redirect_to @circulation, notice: 'Circulation was successfully created.' }
        format.json { render :show, status: :created, location: @circulation }
      else
        format.html { render :new }
        format.json { render json: @circulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circulations/1
  # PATCH/PUT /circulations/1.json
  def update
    respond_to do |format|
      if @circulation.update(circulation_params)
        format.html { redirect_to @circulation, notice: 'Circulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @circulation }
      else
        format.html { render :edit }
        format.json { render json: @circulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circulations/1
  # DELETE /circulations/1.json
  def destroy
    @circulation.destroy
    respond_to do |format|
      format.html { redirect_to circulations_url, notice: 'Circulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circulation
      @circulation = Circulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circulation_params
      params.require(:circulation).permit(:oclc_number, :loan_date)
    end
end
