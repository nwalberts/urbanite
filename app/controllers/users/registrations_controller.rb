class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created an account! Now sign in plz thx."
      redirect_to new_user_session_path
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def after_inactive_sign_up_path_for(*)
    '/users/sign_in'
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :home_location,
      :email,
      :password,
      :password_confirmation
    )
  end
end
