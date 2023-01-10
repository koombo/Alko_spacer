class AlcoholsController < ApplicationController
  before_action :set_alcohol, only: %i[ show edit update destroy ]

  # GET /alcohols or /alcohols.json
  def index
    @alcohols = Alcohol.all
  end

  # GET /alcohols/1 or /alcohols/1.json
  def show
  end

  # GET /alcohols/new
  def new
    @alcohol = Alcohol.new
    @alcohol.build_alcohol_review
    @alcohol.build_alcohol_type
  end

  # GET /alcohols/1/edit
  def edit
  end

  # POST /alcohols or /alcohols.json
  def create
  @alcohol = Alcohol.new(alcohol_params.merge(nested_alcohol_params[:alcohol_review_attributes[:score]].to_i))

    respond_to do |format|
      if @alcohol.save
        format.html { redirect_to alcohol_url(@alcohol), notice: "Alcohol was successfully created." }
        format.json { render :show, status: :created, location: @alcohol }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alcohol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alcohols/1 or /alcohols/1.json
  def update
    respond_to do |format|
      if @alcohol.update(alcohol_params)
        format.html { redirect_to alcohol_url(@alcohol), notice: "Alcohol was successfully updated." }
        format.json { render :show, status: :ok, location: @alcohol }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alcohol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alcohols/1 or /alcohols/1.json
  def destroy
    @alcohol.destroy

    respond_to do |format|
      format.html { redirect_to alcohols_url, notice: "Alcohol was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alcohol
      @alcohol = Alcohol.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alcohol_params
      params.require(:alcohol).permit(:name, :note)
    end

    def nested_alcohol_params
      params.require(:alcohol).permit(alcohol_review_attributes: [:score], alcohol_type_attributes: [:name])
    end

end
