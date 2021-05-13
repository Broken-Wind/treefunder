class InvestmentsController < ApplicationController
  before_action :get_listing
  before_action :set_investment, only: %i[ show edit update destroy ]

  # GET /investments or /investments.json
  def index
    @investments = @listing.investments
  end

  # GET /investments/1 or /investments/1.json
  def show
  end

  # GET /investments/new
  def new
    @investment = @listing.investments.build
  end

  # GET /investments/1/edit
  def edit
  end

  # POST /investments or /investments.json
  def create
    @investment = @listing.investments.build(investment_params)

    respond_to do |format|
      if @investment.save
        format.html { redirect_to listing_investments_path(@listing), notice: "Investment was successfully created." }
        format.json { render :show, status: :created, location: @investment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investments/1 or /investments/1.json
  def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html { redirect_to listing_investment_path(@listing), notice: "Investment was successfully updated." }
        format.json { render :show, status: :ok, location: @investment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1 or /investments/1.json
  def destroy
    @investment.destroy
    respond_to do |format|
      format.html { redirect_to listing_investments_path(@listing), notice: "Investment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = @listing.investments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def investment_params
      params.require(:investment).permit(:amount, :listing_id, :investor_id)
    end

	def get_listing
		@listing = Listing.find(params[:listing_id])
	end
end
