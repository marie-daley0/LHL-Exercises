class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

    if @user.save
      sessions[:user_id] = @user.id #auto-login
      redirect_to movies_path, notice: "Welcome aboard #{@user.firstname}!"
    else 
      render :new
    end 
  end 

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end 
end
 