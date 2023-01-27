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
  @alcohol = Alcohol.new(nested_alcohol_params)
  
    respond_to do |format|
      if @alcohol.save
        format.html { redirect_to alcohol_url(@alcohol), notice: "Stworzono nowy alkohol." }
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
      if @alcohol.update(nested_alcohol_params)
        format.html { redirect_to alcohol_url(@alcohol), notice: "Alkohol został zaktualizowany!" }
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
      format.html { redirect_to alcohols_url, notice: "Alkohol został usunięty." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alcohol
      @alcohol = Alcohol.find(params[:id])
    end

    def nested_alcohol_params
      params.require(:alcohol).permit(:name, :note, images: [], alcohol_review_attributes: [:score], alcohol_type_attributes: [:name])
    end

end
