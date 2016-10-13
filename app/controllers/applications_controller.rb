class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated

  # GET /applications
  # GET /applications.json
  def index
    if current_user.is_admin
      @applications = Application.all
      puts @applications
    elsif current_user.is_seeker
      @applications = Application.where(jobseeker_id: Jobseeker.find_by(user_id: current_user.id).id)
    elsif current_user.is_biz
      @applications = Application.where(job_id: Job.where(bizowner_id: Bizowner.find_by(user_id: current_user.id).id))
    end
  end

  # GET /applications/1
  # GET /applications/1.json

  # GET /applications/new

  # POST /applications
  # POST /applications.json
  def create
    @job_start_date = Job.find_by(id: params[:id]).job_start_date.to_date
    @job_end_date = Job.find_by(id: params[:id]).job_end_date.to_date
    @seeker_start_date = Jobseeker.find_by(user_id: current_user.id).start_date.to_date
    @seeker_end_date = Jobseeker.find_by(user_id: current_user.id).end_date.to_date
    if @job_start_date < @seeker_start_date
      redirect_to root_path, notice: 'Unable to apply. Job starts before your available period'
      return
    elsif @job_end_date > @seeker_end_date
      redirect_to root_path, notice: 'Unable to apply. Job ends after your availabilty period'
      return
    end
    @application = Application.new(job_id: params[:id], jobseeker_id: Jobseeker.find_by(user_id: current_user.id).id, status: "Pending")
      if @application.save
        # ApplicationNotificationMailer.notification_email(params[:id]).deliver
        redirect_to @application, notice: 'You application has been sent. Good luck!'
      else
        redirect_to root_path, notice: 'You have already applied for this job'
      end
  end

  def edit
    unless @current_user.is_admin || Bizowner.find_by(user_id: current_user.id).id == Job.find_by(id: params[:id]).bizowner_id
      flash[:notice] = "You do not have permission to approve/reject applications for jobs that do not belong to you!"
      redirect_to root_path
      return
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_application
    @application = Application.find(params[:id])
    @job = Job.find_by(id: @application.job_id)
    @jobseeker = Jobseeker.find_by(id: @application.jobseeker_id)
    @age = Date.today.year - @jobseeker.dob.year
    @applicant = User.find_by(id: @jobseeker.user_id)
  end

# def age(date)
#   Date.today.year - date.year
# end

  def application_params
    params.require(:application).permit(:status)
  end
end
