class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user) if user_params[:password].present?
      redirect_to profile_path, notice: 'Profile updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, 
      :password, 
      :password_confirmation,
      :first_name,
      :last_name,
      :job_title,
      :avatar
    )
  end
end 