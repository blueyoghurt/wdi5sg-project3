class JobseekersController < ApplicationController
  before_action :is_authenticated

  def new
    @jobseeker = Jobseeker.new
  end

  def create
    @jobseeker = Jobseeker.new(job_params)
    @jobseeker.update(user_id: current_user.id)
    @jobseeker.update(availability: true)

    respond_to do |format|
      if @jobseeker.save
        format.html { redirect_to job_profile_path,notice: "Job Profile has been successfully created!" }
        format.json { render :show, status: :created, location: @jobseeker }
      else
        format.html { render :new }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @jobseeker.destroy
    respond_to do |format|
      format.html { redirect_to jobseekers_url, notice: 'Job Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @jobseeker = Jobseeker.find_by(user_id: current_user.id)
  end

  def show
    @jobseeker = Jobseeker.find_by(user_id: current_user.id)
  end

  def update
    @jobseeker = Jobseeker.find_by(user_id: current_user.id)
    respond_to do |format|
      if @jobseeker.update(job_params)
        format.html { redirect_to job_profile_path, notice: 'Job Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobseeker }
      else
        format.html { render :edit }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:jobseeker).permit(:dob, :postal_code , :highest_qualification, :preferred_area, :preferred_location, :description, :wage, :start_date, :end_date)
  end

end
