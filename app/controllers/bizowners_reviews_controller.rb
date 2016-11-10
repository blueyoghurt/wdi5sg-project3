class BizownersReviewsController < ApplicationController
  before_action :set_bizowners_review, only: [:show, :destroy]

  # GET /bizowners_reviews
  # GET /bizowners_reviews.json
  def index
    # If admin user, send him all BizownerReviews
    @bizowners_reviews = BizownersReview.all
    # Find the jobs related to the Bizowner
    @job = Job.where(bizowner_id: Bizowner.find_by(user_id: current_user.id).id)
    # Find the applications where job status are "Approved"
    @applications = Application.where(job_id: @job.ids).where(status: "Approved")
  end

  def show
  end

  # GET /bizowners_reviews/new
  def new
    # Prevent users from accessing applications that they do not belong to them
    unless Bizowner.find_by(user_id: session[:user_id]).id == Job.find_by(id: Application.find_by(id: params[:application]).job_id).bizowner_id
      flash[:notice] = "This application does not belong to you!"
      redirect_to root_path
      return
    end

    # Prevent users from reviewing jobs that they have not been approved yet
    unless Application.find_by(id: params[:application]).status == "Approved"
      flash[:notice] = "You do not have permission to review a job that you have not approved yet!"
      redirect_to root_path
      return
    end

    @bizowners_review = BizownersReview.new
    # Find the related application for the review and display the relavant information in the view
    @application = Application.find_by(id: params[:application])
  end

  # POST /bizowners_reviews
  # POST /bizowners_reviews.json
  def create

    unless Bizowner.find_by(user_id: session[:user_id]).id == Job.find_by(id: Application.find_by(id: Integer(bizowners_review_params[:application_id])).job_id).bizowner_id
      flash[:notice] = "This application does not belong to you!"
      redirect_to root_path
      return
    end

    unless Application.find_by(id: Integer(bizowners_review_params[:application_id])).status == "Approved"
      flash[:notice] = "You do not have permission to review a job that you have not been hired for!"
      redirect_to root_path
      return
    end

    @bizowners_review = BizownersReview.new(bizowners_review_params)
    @bizowners_review.update(bizowner_id: Bizowner.find_by(user_id: current_user.id).id)
    @bizowners_review.update(jobseeker_id: Application.find_by(id: @bizowners_review.application_id).jobseeker_id)
    @bizowners_review.update(status: true)
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
    params.require(:bizowners_review).permit(:star, :description, :application_id)
  end
end
