class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = "User logged in!!"
      if user.is_seeker && !Jobseeker.find_by(user_id: current_user.id)
        redirect_to job_register_profile_path, notice: "Let's create your job profile!"
      elsif user.is_biz && !Bizowner.find_by(user_id: current_user.id)
        redirect_to business_register_profile_path, notice: "Let's create your business profile!"
      else
        redirect_to root_path
      end
    else
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "User logged out!!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
