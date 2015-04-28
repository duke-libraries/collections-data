class OverlapHoldingsController < ApplicationController
  before_action :set_overlap_holding, only: [:show, :edit, :update, :destroy]

  # GET /overlap_holdings
  # GET /overlap_holdings.json
  def index
    @overlap_holdings = OverlapHolding.all
  end

  # GET /overlap_holdings/1
  # GET /overlap_holdings/1.json
  def show
  end

  # GET /overlap_holdings/new
  def new
    @overlap_holding = OverlapHolding.new
  end

  # GET /overlap_holdings/1/edit
  def edit
  end

  # POST /overlap_holdings
  # POST /overlap_holdings.json
  def create
    @overlap_holding = OverlapHolding.new(overlap_holding_params)

    respond_to do |format|
      if @overlap_holding.save
        format.html { redirect_to @overlap_holding, notice: 'Overlap holding was successfully created.' }
        format.json { render :show, status: :created, location: @overlap_holding }
      else
        format.html { render :new }
        format.json { render json: @overlap_holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overlap_holdings/1
  # PATCH/PUT /overlap_holdings/1.json
  def update
    respond_to do |format|
      if @overlap_holding.update(overlap_holding_params)
        format.html { redirect_to @overlap_holding, notice: 'Overlap holding was successfully updated.' }
        format.json { render :show, status: :ok, location: @overlap_holding }
      else
        format.html { render :edit }
        format.json { render json: @overlap_holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overlap_holdings/1
  # DELETE /overlap_holdings/1.json
  def destroy
    @overlap_holding.destroy
    respond_to do |format|
      format.html { redirect_to overlap_holdings_url, notice: 'Overlap holding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overlap_holding
      @overlap_holding = OverlapHolding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overlap_holding_params
      params.require(:overlap_holding).permit(:oclc_number, :shared_by)
    end
end
