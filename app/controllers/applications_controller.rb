class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, only: [:index, :show, :new, :edit]

  # GET /applications
  # GET /applications.json
  def index
    if current_user.is_admin
      @applications = Application.all
      elsif current_user.is_seeker
      @applications = Application.where(jobseeker_id: Jobseeker.find_by(user_id: current_user.id).id)
      else
      @applications = Application.where(job_id: Bizowner.find_by(user_id: current_user.id).id)
    end
  end

  # GET /applications/1
  # GET /applications/1.json

  # GET /applications/new

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(job_id: params[:id], jobseeker_id: Jobseeker.find_by(user_id: current_user.id).id, status: "Pending")
    respond_to do |format|
      if @application.save
        ApplicationNotificationMailer.notification_email(params[:id]).deliver
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { redirect_to root_path, notice: 'You have already applied for this job' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @bizowner = Bizowner.find_by(user_id: current_user.id)
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
  end

end
