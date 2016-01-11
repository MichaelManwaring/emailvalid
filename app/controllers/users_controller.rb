class UsersController < ApplicationController
  def new
  	@user=User.new
  	@users=User.all
  end

  def create
  	@user = User.new(user_params)
  	@user.key = 10*rand
  	@user.save
  end

  def edit
  end

  def destroy
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
