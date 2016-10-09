class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, except: [:new, :create]
  before_action :is_authenticated_admin, only: [:index, :destroy, :toggle_admin]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        if @user.is_seeker
          @user.update(is_biz: false)
        elsif !@user.is_seeker
          @user.update(is_biz: true)
        end
        session[:user_id] = @user.id
        format.html { if @user.is_seeker
          redirect_to job_register_profile_path,notice: "Let's create your profile!"
        else
          redirect_to business_register_profile_path, notice: "Let's create your business profile!"
        end }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT  /users/1/admin
  def toggle_admin
    @user = User.find(params[:id])
    @user.is_admin = !@user.is_admin
    if @user.save
      redirect_to users_url, notice: "User #{@user.name} Admin status is: #{@user.is_admin?}"
    else
      redirect_to users_url, notice: "Error setting admin status: #{@user.errors.full_messages.first}"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(session[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name , :email, :password, :contact, :is_seeker)
  end
end
