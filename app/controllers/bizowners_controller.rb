class BizownersController < ApplicationController
  before_action :is_authenticated

  def new
    @bizowner = Bizowner.new
  end

  def create
    @bizowner = Bizowner.new(biz_params)
    @bizowner.update(user_id: current_user.id)

    respond_to do |format|
      if @bizowner.save
        format.html { redirect_to business_profile_path,notice: "Business Profile has been successfully created!" }
        format.json { render :show, status: :created, location: @bizowner }
      else
        format.html { render :new }
        format.json { render json: @bizowner.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @jobseeker = Jobseeker.find_by(user_id: current_user.id)
  end


  def destroy
    @bizowner.destroy
    respond_to do |format|
      format.html { redirect_to bizowners_url, notice: 'Business Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @bizowner = Bizowner.find_by(user_id: current_user.id)
  end

  def show
    @bizowner = Bizowner.find_by(user_id: current_user.id)
  end

  def update
    @bizowner = Bizowner.find_by(user_id: current_user.id)
    respond_to do |format|
      if @bizowner.update(biz_params)
        format.html { redirect_to business_profile_path, notice: 'Business Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @bizowner }
      else
        format.html { render :edit }
        format.json { render json: @bizowner.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def biz_params
    params.require(:bizowner).permit(:name, :description , :license_number, :postal_code, :address)
  end

end
