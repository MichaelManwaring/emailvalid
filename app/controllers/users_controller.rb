class UsersController < ApplicationController
  def new
  	@user=User.new
  	@users=User.all
  end

  def create
  	@user = User.new(user_params)
  	@user.status = (3*rand).ceil
  	@user.key = (8999*rand+1000).ceil 	
  	@user.save
  	@status=@user.status_print
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
