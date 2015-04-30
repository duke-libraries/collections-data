class AnalysisGroupsController < ApplicationController
  
  require 'histogram/array' 

  before_action :set_analysis_group, only: [:show, :edit, :update, :destroy]

  # GET /analysis_groups
  # GET /analysis_groups.json
  def index
    @analysis_groups = AnalysisGroup.all
  end

  # GET /analysis_groups/1
  # GET /analysis_groups/1.json
  def show
    overlap = []
    interlibrary_loans = []
    @analysis_group.monograph_holdings.each do |holding|
      overlap << holding.overlap_holdings_count
      interlibrary_loans << holding.interlibrary_loans_count
    end

    overlap_overall = OverlapHolding.pluck(:shared_by)
    interlibrary_loans_overall = InterlibraryLoan.group(:oclc_number).count.values

    @overlap_histogram = overlap.histogram(20, :min => 0, :max => 2685)
    @overlap_histogram_overall = overlap_overall.histogram(20, :min => 0, :max => 2685)

    @interlibrary_loans_histogram = interlibrary_loans.histogram(20, :min => 0, :max => 61)
    @interlibrary_loans_histogram_overall = interlibrary_loans_overall.histogram(20, :min => 0, :max => 61)
  end

  # GET /analysis_groups/new
  def new
    @analysis_group = AnalysisGroup.new
  end

  # GET /analysis_groups/1/edit
  def edit
  end

  # POST /analysis_groups
  # POST /analysis_groups.json
  def create
    @analysis_group = AnalysisGroup.new(analysis_group_params)

    respond_to do |format|
      if @analysis_group.save
        format.html { redirect_to @analysis_group, notice: 'Analysis group was successfully created.' }
        format.json { render :show, status: :created, location: @analysis_group }
      else
        format.html { render :new }
        format.json { render json: @analysis_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analysis_groups/1
  # PATCH/PUT /analysis_groups/1.json
  def update
    respond_to do |format|
      if @analysis_group.update(analysis_group_params)
        format.html { redirect_to @analysis_group, notice: 'Analysis group was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis_group }
      else
        format.html { render :edit }
        format.json { render json: @analysis_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysis_groups/1
  # DELETE /analysis_groups/1.json
  def destroy
    @analysis_group.destroy
    respond_to do |format|
      format.html { redirect_to analysis_groups_url, notice: 'Analysis group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis_group
      @analysis_group = AnalysisGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_group_params
      params.require(:analysis_group).permit(:name)
    end
end
