class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :image, :username )
  end

  def account_update_params
        params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :image, :username)
  end
end
