class Users::SessionsController < Users::Base

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.create(user_params)
    if @user.email.present?
      user = User.find_by(email: @user.email.downcase)
    end
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render action: "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end

end
