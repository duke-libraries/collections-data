class OverlapGroupsController < ApplicationController
  before_action :set_overlap_group, only: [:show, :edit, :update, :destroy]

  # GET /overlap_groups
  # GET /overlap_groups.json
  def index
    @overlap_groups = OverlapGroup.all
  end

  # GET /overlap_groups/1
  # GET /overlap_groups/1.json
  def show
  end

  # GET /overlap_groups/new
  def new
    @overlap_group = OverlapGroup.new
  end

  # GET /overlap_groups/1/edit
  def edit
  end

  # POST /overlap_groups
  # POST /overlap_groups.json
  def create
    @overlap_group = OverlapGroup.new(overlap_group_params)

    respond_to do |format|
      if @overlap_group.save
        format.html { redirect_to @overlap_group, notice: 'Overlap group was successfully created.' }
        format.json { render :show, status: :created, location: @overlap_group }
      else
        format.html { render :new }
        format.json { render json: @overlap_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overlap_groups/1
  # PATCH/PUT /overlap_groups/1.json
  def update
    respond_to do |format|
      if @overlap_group.update(overlap_group_params)
        format.html { redirect_to @overlap_group, notice: 'Overlap group was successfully updated.' }
        format.json { render :show, status: :ok, location: @overlap_group }
      else
        format.html { render :edit }
        format.json { render json: @overlap_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overlap_groups/1
  # DELETE /overlap_groups/1.json
  def destroy
    @overlap_group.destroy
    respond_to do |format|
      format.html { redirect_to overlap_groups_url, notice: 'Overlap group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overlap_group
      @overlap_group = OverlapGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overlap_group_params
      params.require(:overlap_group).permit(:name)
    end
end
