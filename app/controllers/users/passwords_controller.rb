class Users::PasswordsController < ApplicationController
  def show
    redirect_to edit_users_password_path
  end

  def edit
    @change_password_form =
      Users::ChangePasswordForm.new(object: current_user)
  end

  def update
    @change_password_form = Users::ChangePasswordForm.new(user_params)
    @change_password_form.object = current_user
    if @change_password_form.save
      redirect_to users_account_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:users_change_password_form).permit(:current_password, :new_password, :new_password_confirmation)
    end

end
