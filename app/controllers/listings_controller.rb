class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]
  before_action :is_authenticated, except: [:index]
  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  def bizowner
    @listings = Listing.where(bizowner_id: Bizowner.find_by(user_id: current_user.id).id)
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find params[:id]
    unless @current_user.is_admin || Bizowner.find_by(user_id: session[:user_id]).id == @listing.bizowner_id
      flash[:notice] = "You do not have permission to edit listings that do not belong to you!"
      redirect_to root_path
      return
    end
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.update(bizowner_id: Bizowner.find_by(user_id: current_user.id).id)
    @listing.update(status: true)
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    params.require(:listing).permit(:job_title, :job_description, :industry, :vacancy, :work_location_postal_code, :work_area, :work_location, :wage_per_hour, :job_start_date, :job_end_date)
  end
end
