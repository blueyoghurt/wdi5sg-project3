class JobseekersReviewsController < ApplicationController
  before_action :set_jobseekers_review, only: [:show, :edit, :update, :destroy]

  # GET /jobseekers_reviews
  # GET /jobseekers_reviews.json
  def index
    @jobseekers_reviews = JobseekersReview.all
    @jobseeker = Jobseeker.find_by(user_id: current_user.id)
    @all_my_applications= Application.where(jobseeker_id: @jobseeker.id)
    @applications = @all_my_applications.where(status: "Approved")
    puts @applicatons.inspect
  end

  # GET /jobseekers_reviews/1
  # GET /jobseekers_reviews/1.json
  def show
  end

  # GET /jobseekers_reviews/new
  def new
    @jobseekers_review = JobseekersReview.new
  end

  # GET /jobseekers_reviews/1/edit
  def edit
  end

  # POST /jobseekers_reviews
  # POST /jobseekers_reviews.json
  def create
    @jobseekers_review = JobseekersReview.new(jobseekers_review_params)
    @jobseekers_review.update(bizowner_id: current_user.id)
    @jobseekers_review.update(status: true)
    respond_to do |format|
      if @jobseekers_review.save
        format.html { redirect_to @jobseekers_review, notice: 'Jobseekers review was successfully created.' }
        format.json { render :show, status: :created, location: @jobseekers_review }
      else
        format.html { render :new }
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
      params.require(:jobseekers_review).permit(:jobseeker_id, :bizowner_id, :jobseeker_review_star, :jobseeker_review_description, :job_end_date, :status)
    end
end
