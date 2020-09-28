class Users::AccountsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @account = current_user
  end

  def edit
    if !current_user
      redirect_to users_login_path
    else
      @user = current_user
    end
  end

  def update
    @user = current_user.update(user_params)
    if @user
      redirect_to root_path
    else
      render action: :edit
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :birth_date, :icon_img, :password)
    end

end
