class MonographHoldingsController < ApplicationController
  before_action :set_monograph_holding, only: [:show, :edit, :update, :destroy]

  # GET /monograph_holdings
  # GET /monograph_holdings.json
  def index
    @monograph_holdings = MonographHolding.where(nil).page params[:page] # creates an anonymous scope
    @monograph_holdings = @monograph_holdings.sub_library(params[:sub_library]) if params[:sub_library].present?
    @monograph_holdings = @monograph_holdings.language(params[:language]) if params[:language].present?

    #@monograph_holdings = @monograph_holdings.where(:sub_library => params[:sub_library].split(",")) if params[:sub_library].present?

    #@monograph_holdings = @monograph_holdings.where(:language => params[:language].split(",")) if params[:language].present?
  end

  # GET /monograph_holdings/1
  # GET /monograph_holdings/1.json
  def show
  end

  # GET /monograph_holdings/new
  def new
    @monograph_holding = MonographHolding.new
  end

  # GET /monograph_holdings/1/edit
  def edit
  end

  # POST /monograph_holdings
  # POST /monograph_holdings.json
  def create
    @monograph_holding = MonographHolding.new(monograph_holding_params)

    respond_to do |format|
      if @monograph_holding.save
        format.html { redirect_to @monograph_holding, notice: 'Monograph holding was successfully created.' }
        format.json { render :show, status: :created, location: @monograph_holding }
      else
        format.html { render :new }
        format.json { render json: @monograph_holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monograph_holdings/1
  # PATCH/PUT /monograph_holdings/1.json
  def update
    respond_to do |format|
      if @monograph_holding.update(monograph_holding_params)
        format.html { redirect_to @monograph_holding, notice: 'Monograph holding was successfully updated.' }
        format.json { render :show, status: :ok, location: @monograph_holding }
      else
        format.html { render :edit }
        format.json { render json: @monograph_holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monograph_holdings/1
  # DELETE /monograph_holdings/1.json
  def destroy
    @monograph_holding.destroy
    respond_to do |format|
      format.html { redirect_to monograph_holdings_url, notice: 'Monograph holding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monograph_holding
      @monograph_holding = MonographHolding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monograph_holding_params
      params.require(:monograph_holding).permit(:oclc_number, :lc_number, :title, :author, :publisher, :price, :acquisition_modality)
    end
end
