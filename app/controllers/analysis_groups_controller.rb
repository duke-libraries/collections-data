class AnalysisGroupsController < ApplicationController
  
  require 'histogram/array' 

  before_action :set_analysis_group, only: [:show, :edit, :update, :destroy]
  #before_action :zero_circulations, only: [:show]

  # GET /analysis_groups
  # GET /analysis_groups.json
  def index
    @analysis_groups = AnalysisGroup.all
  end

  # GET /analysis_groups/1
  # GET /analysis_groups/1.json
  def show
    overlap1 = []
    overlap2 = []
    interlibrary_loans = []
    circulations = []
    @analysis_group.monograph_holdings.each do |holding|
      overlap1 << holding.overlap_holdings_count(1)
      overlap2 << holding.overlap_holdings_count(2)
      interlibrary_loans << holding.interlibrary_loans_count
      circulations << holding.circulation_count
    end

    #This isn't quite right. Need distinct OCLC Numbers because there will be overlap
    #Maybe something like this will work
    #ActiveRecord::Base.connection.execute("SELECT SUM(shared_by) FROM (SELECT * FROM overlap_holdings GROUP BY oclc_number)")

    overlap_overall = OverlapHolding.pluck(:shared_by)

    interlibrary_loans_overall = InterlibraryLoan.group(:oclc_number).count.values
    interlibrary_loans_overall.concat(Array.new(zero_interlibrary_loans, 0))

    circulations_overall = Circulation.group(:oclc_number).count.values
    circulations_overall.concat(Array.new(zero_circulations, 0))

    # max = overlap1.max > overlap_overall.max ? overlap1.max : overlap_overall.max
    # max = overlap2.max > max ? overlap2.max : max

    # @overlap1_histogram = overlap1.histogram(10, :min => 0, :max => max)
    # @overlap2_histogram = overlap2.histogram(10, :min => 0, :max => max)
    # @overlap_histogram_overall = overlap_overall.histogram(10, :min => 0, :max => max)

    # @interlibrary_loans_histogram = interlibrary_loans.histogram(10, :min => 0, :max => 61)
    # @interlibrary_loans_histogram_overall = interlibrary_loans_overall.histogram(10, :min => 0, :max => 61)

    # @circulation_histogram = circulations.histogram(10, :min => 0, :max => 40)
    # @circulation_histogram_overall = circulations_overall.histogram(10, :min => 0, :max => 1300)

    # @overlap1_histogram = overlap1.histogram()
    # @overlap2_histogram = overlap2.histogram()
    # @overlap_histogram_overall = overlap_overall.histogram()

    # @interlibrary_loans_histogram = interlibrary_loans.histogram()
    # @interlibrary_loans_histogram_overall = interlibrary_loans_overall.histogram()

    # @circulation_histogram = circulations.histogram()
    # @circulation_histogram_overall = circulations_overall.histogram()


    @overlap1_desc = DescriptiveStatistics::Stats.new(overlap1)
    @overlap2_desc = DescriptiveStatistics::Stats.new(overlap2)
    @interlibrary_loans_desc = DescriptiveStatistics::Stats.new(interlibrary_loans)
    @circulations_desc = DescriptiveStatistics::Stats.new(circulations)

    @overlap_overall_desc = DescriptiveStatistics::Stats.new(overlap_overall)
    @interlibrary_loans_overall_desc = DescriptiveStatistics::Stats.new(interlibrary_loans_overall)
    @circulations_overall_desc = DescriptiveStatistics::Stats.new(circulations_overall)

    
    @interlibrary_loan_items_overall_count = InterlibraryLoan.all.distinct.count(:oclc_number) + zero_interlibrary_loans
    @interlibrary_loan_overall_count = InterlibraryLoan.all.count

    @interlibrary_loan_items_count = interlibrary_loans.count
    @interlibrary_loan_count = interlibrary_loans.sum

    @circulation_items_overall_count = Circulation.all.distinct.count(:oclc_number) + zero_circulations
    @circulation_overall_count = Circulation.all.count

    @circulation_items_count = circulations.count
    @circulation_count = circulations.sum

    @overlap_items_overall_count = OverlapHolding.all.distinct.count(:oclc_number)
    @overlap_overall_count = ActiveRecord::Base.connection.execute("SELECT SUM(shared_by) FROM (SELECT * FROM overlap_holdings GROUP BY oclc_number)")[0][0]

    @overlap1_item_count = overlap1.count
    @overlap1_count = overlap1.sum

    @overlap2_item_count = overlap2.count
    @overlap2_count = overlap2.sum

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

    def zero_circulations
      zero_count = MonographHolding.joins('left outer join circulations on monograph_holdings.oclc_number=circulations.oclc_number').select('monograph_holdings.*,circulations.oclc_number').where('circulations.oclc_number is null').pluck(:oclc_number).count
    end

    def zero_interlibrary_loans
      zero_count = MonographHolding.joins('left outer join interlibrary_loans on monograph_holdings.oclc_number=interlibrary_loans.oclc_number').select('monograph_holdings.*,interlibrary_loans.oclc_number').where('interlibrary_loans.oclc_number is null').pluck(:oclc_number).count
    end
end
