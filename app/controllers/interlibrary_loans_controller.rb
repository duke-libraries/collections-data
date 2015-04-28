class InterlibraryLoansController < ApplicationController
  before_action :set_interlibrary_loan, only: [:show, :edit, :update, :destroy]

  # GET /interlibrary_loans
  # GET /interlibrary_loans.json
  def index
    @interlibrary_loans = InterlibraryLoan.all
  end

  # GET /interlibrary_loans/1
  # GET /interlibrary_loans/1.json
  def show
  end

  # GET /interlibrary_loans/new
  def new
    @interlibrary_loan = InterlibraryLoan.new
  end

  # GET /interlibrary_loans/1/edit
  def edit
  end

  # POST /interlibrary_loans
  # POST /interlibrary_loans.json
  def create
    @interlibrary_loan = InterlibraryLoan.new(interlibrary_loan_params)

    respond_to do |format|
      if @interlibrary_loan.save
        format.html { redirect_to @interlibrary_loan, notice: 'Interlibrary loan was successfully created.' }
        format.json { render :show, status: :created, location: @interlibrary_loan }
      else
        format.html { render :new }
        format.json { render json: @interlibrary_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interlibrary_loans/1
  # PATCH/PUT /interlibrary_loans/1.json
  def update
    respond_to do |format|
      if @interlibrary_loan.update(interlibrary_loan_params)
        format.html { redirect_to @interlibrary_loan, notice: 'Interlibrary loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @interlibrary_loan }
      else
        format.html { render :edit }
        format.json { render json: @interlibrary_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interlibrary_loans/1
  # DELETE /interlibrary_loans/1.json
  def destroy
    @interlibrary_loan.destroy
    respond_to do |format|
      format.html { redirect_to interlibrary_loans_url, notice: 'Interlibrary loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interlibrary_loan
      @interlibrary_loan = InterlibraryLoan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interlibrary_loan_params
      params.require(:interlibrary_loan).permit(:oclc_number, :request_type, :transaction_date)
    end
end
