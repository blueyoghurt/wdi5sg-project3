class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, except: [:index]
  helper_method :sort_column, :sort_direction

  # GET /jobs
  # GET /jobs.json
  def index
    params.permit!
    #Hack way to resolve permit problem.
    # @jobs = Job.all
    # @jobs = Job.search(params[:search],params[:fieldtype]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])


# search(params[:search],params[:fieldtype]).

    @jobs = Job.search(params[:search],params[:fieldtype]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)

    @map_hash = Gmaps4rails.build_markers(@jobs) do |job, marker|
      marker.lat job.latitude
      marker.lng job.longitude
      marker.infowindow job.company_name
    end
  end

  def bizowner
    params.permit!
    @jobs = Job.where(bizowner_id: Bizowner.find_by(user_id: current_user.id).id)
    @jobs = Job.paginate(:page => params[:page], :per_page => 1)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find params[:id]
    unless @current_user.is_admin || Bizowner.find_by(user_id: session[:user_id]).id == @job.bizowner_id
      flash[:notice] = "You do not have permission to edit listings that do not belong to you!"
      redirect_to root_path
      return
    end
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.update(bizowner_id: Bizowner.find_by(user_id: current_user.id).id)
    @job.update(status: true)
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        puts "job params is ", job_params.inspect ,"@job is ", @job.inspect
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    Job.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:company_name, :job_title, :job_description, :address, :industry, :vacancy, :wage_per_hour, :job_start_date, :job_end_date)
  end
end
