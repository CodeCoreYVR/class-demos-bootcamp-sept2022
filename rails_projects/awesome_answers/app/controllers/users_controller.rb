class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :address
    )

    if @user.save
      session[:user_id] = @user.id
      # your application has a session for each user in which you can store small amounts of data
      # the session is only available in the controller and the view
      flash.notice = "Signed Up!"
      redirect_to root_path
    else
      render :new, status: 303
    end
  end

  def show
    @user = User.find params[:id]
  end
end
