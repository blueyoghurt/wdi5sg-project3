class JobseekersReviewsController < ApplicationController
  before_action :set_jobseekers_review, only: [:show, :destroy]

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
    # Prevent users from accessing applications that they did not apply for
    unless Jobseeker.find_by(user_id: session[:user_id]).id == Application.find_by(id: params[:application]).jobseeker_id
      flash[:notice] = "This application does not belong to you!"
      redirect_to root_path
      return
    end

    # Prevent users from reviewing jobs that they have not been hired for yet
    unless Application.find_by(id: params[:application]).status == "Approved"
      flash[:notice] = "You do not have permission to review a job that you have not been hired for!"
      redirect_to root_path
      return
    end

    @jobseekers_review = JobseekersReview.new
    # Find the related application for the review and display the relavant information in the view
    @application = Application.find_by(id: params[:application])
  end

  # POST /jobseekers_reviews
  # POST /jobseekers_reviews.json
  def create

    unless Jobseeker.find_by(user_id: session[:user_id]).id == Application.find_by(id: Integer(jobseekers_review_params[:application_id])).jobseeker_id
      flash[:notice] = "This application does not belong to you!"
      redirect_to root_path
      return
    end

    unless Application.find_by(id: Integer(jobseekers_review_params[:application_id])).status == "Approved"
      flash[:notice] = "You do not have permission to review a job that you have not been hired for!"
      redirect_to root_path
      return
    end

    @jobseekers_review = JobseekersReview.new(jobseekers_review_params)
    @jobseekers_review.update(jobseeker_id: Jobseeker.find_by(user_id: current_user.id).id)
    @jobseekers_review.update(bizowner_id: Job.find_by(id: Application.find_by(id: @jobseekers_review.application_id).job_id).bizowner_id)
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
    params.require(:jobseekers_review).permit(:star, :description, :application_id)
  end

end
