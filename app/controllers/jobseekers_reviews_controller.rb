class JobseekersReviewsController < ApplicationController
  before_action :set_jobseekers_review, only: [:show, :edit, :update, :destroy]

  # GET /jobseekers_reviews
  # GET /jobseekers_reviews.json

  def index
    # If admin user, send him all JobseekersReviews
    @jobseekers_reviews = JobseekersReview.all
    # Find the applications where job status are "Approved"
    @applications = Application.where(jobseeker_id: Jobseeker.find_by(user_id: current_user.id).id).where(status: "Approved")
  end

  # GET /jobseekers_reviews/1
  # GET /jobseekers_reviews/1.json
  def show
  end

  # GET /jobseekers_reviews/new
  def new
    @jobseekers_review = JobseekersReview.new
    # Find the related application for the review and display the relavant information in the view
    @application = Application.find_by(id: params[:application])
  end

  # GET /jobseekers_reviews/1/edit
  def edit
  end

  # POST /jobseekers_reviews
  # POST /jobseekers_reviews.json
  def create
    @jobseekers_review = JobseekersReview.new(jobseekers_review_params)
    @jobseekers_review.update(jobseeker_id: Jobseeker.find_by(user_id: current_user.id).id)
    # @jobseekers_review.update(bizowner_id: 1)
    # @jobseekers_review.update(application_id: 1)
    @jobseekers_review.update(status: true)
    respond_to do |format|
      if @jobseekers_review.save
        format.html { redirect_to jobseekers_reviews_path, notice: 'Jobseekers review was successfully created.' }
        format.json { render :show, status: :created, location: @jobseekers_review }
      else
        # format.html { render :new }
        format.html { redirect_to jobseekers_reviews_path, notice: 'Creation failed.' }
        format.json { render json: @jobseekers_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobseekers_reviews/1
  # PATCH/PUT /jobseekers_reviews/1.json
  def update
    respond_to do |format|
      if @jobseekers_review.update(jobseekers_review_params)
        format.html { redirect_to @jobseekers_review, notice: 'Jobseekers review was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobseekers_review }
      else
        format.html { render :edit }
        format.json { render json: @jobseekers_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobseekers_reviews/1
  # DELETE /jobseekers_reviews/1.json
  def destroy
    @jobseekers_review.destroy
    respond_to do |format|
      format.html { redirect_to jobseekers_reviews_url, notice: 'Jobseekers review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobseekers_review
      @jobseekers_review = JobseekersReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobseekers_review_params
      params.require(:jobseekers_review).permit(:star, :description)
    end
end
