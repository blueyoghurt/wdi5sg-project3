class JobseekersController < ApplicationController
  before_action :is_authenticated

  def new
    @jobseeker = Jobseeker.new
  end

  def create
    @jobseeker = Jobseeker.new(job_params)
    @jobseeker.update(user_id: current_user.id)

    respond_to do |format|
      if @jobseeker.save
        format.html { redirect_to root_path,notice: "Job Profile has been successfully created!" }
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

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:jobseeker).permit(:dob, :postal_code , :highest_qualification, :preferred_area, :preferred_location, :description, :wage, :start_date, :end_date)
  end

end
