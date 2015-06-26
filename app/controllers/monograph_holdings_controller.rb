class MonographHoldingsController < ApplicationController
  before_action :set_monograph_holding, only: [:show, :edit, :update, :destroy]

  # GET /monograph_holdings
  # GET /monograph_holdings.json
  def index

    @monograph_holdings = MonographHolding.where(nil).page params[:page] # creates an anonymous scope
    @monograph_holdings = @monograph_holdings.sub_library(params[:sub_library]) if params[:sub_library].present?
    @monograph_holdings = @monograph_holdings.language(params[:language]) if params[:language].present?
    @monograph_holdings = @monograph_holdings.collection(params[:collection]) if params[:collection].present?
    @monograph_holdings = @monograph_holdings.material_type(params[:material_type]) if params[:material_type].present?
    @monograph_holdings = @monograph_holdings.publication_year(params[:publication_year]) if params[:publication_year].present?
    @monograph_holdings = @monograph_holdings.acquisition_date(params[:acquisition_date]) if params[:acquisition_date].present?
    @monograph_holdings = @monograph_holdings.publisher(params[:publisher]) if params[:publisher].present?

    @collections = MonographHolding.uniq.pluck(:collection).compact.sort
    @sub_libraries = MonographHolding.uniq.pluck(:sub_library).compact.sort
    @languages = MonographHolding.uniq.pluck(:language).compact.sort
    @material_types = MonographHolding.uniq.pluck(:material_type).compact.sort

    @selected_collections = (params[:collection].present? ? params[:collection] : [])
    @selected_sub_libraries = (params[:sub_library].present? ? params[:sub_library] : [])
    @selected_languages = (params[:language].present? ? params[:language] : [])
    @selected_material_types = (params[:material_type].present? ? params[:material_type] : [])
    @selected_publication_year = (params[:publication_year].present? ? params[:publication_year] : [])
    @selected_acquisition_date = (params[:acquisition_date].present? ? params[:acquisition_date] : [])
    @selected_publisher = (params[:publisher].present? ? params[:publisher] : [])

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
