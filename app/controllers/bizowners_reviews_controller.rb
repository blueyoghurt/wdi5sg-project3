class BizownersReviewsController < ApplicationController
  before_action :set_bizowners_review, only: [:show, :edit, :update, :destroy]

  # GET /bizowners_reviews
  # GET /bizowners_reviews.json
  def index
    @bizowners_reviews = BizownersReview.all
  end

  # GET /bizowners_reviews/1
  # GET /bizowners_reviews/1.json
  def show
  end

  # GET /bizowners_reviews/new
  def new
    @bizowners_review = BizownersReview.new
  end

  # GET /bizowners_reviews/1/edit
  def edit
  end

  # POST /bizowners_reviews
  # POST /bizowners_reviews.json
  def create
    @bizowners_review = BizownersReview.new(bizowners_review_params)

    respond_to do |format|
      if @bizowners_review.save
        format.html { redirect_to @bizowners_review, notice: 'Bizowners review was successfully created.' }
        format.json { render :show, status: :created, location: @bizowners_review }
      else
        format.html { render :new }
        format.json { render json: @bizowners_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bizowners_reviews/1
  # PATCH/PUT /bizowners_reviews/1.json
  def update
    respond_to do |format|
      if @bizowners_review.update(bizowners_review_params)
        format.html { redirect_to @bizowners_review, notice: 'Bizowners review was successfully updated.' }
        format.json { render :show, status: :ok, location: @bizowners_review }
      else
        format.html { render :edit }
        format.json { render json: @bizowners_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bizowners_reviews/1
  # DELETE /bizowners_reviews/1.json
  def destroy
    @bizowners_review.destroy
    respond_to do |format|
      format.html { redirect_to bizowners_reviews_url, notice: 'Bizowners review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bizowners_review
      @bizowners_review = BizownersReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bizowners_review_params
      params.require(:bizowners_review).permit(:bizowner_id, :jobseeker_id, :bizowner_review_star, :business_review_description, :job_end_date, :status)
    end
end
