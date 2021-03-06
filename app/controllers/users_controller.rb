class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "You got it Pontiac"
  		redirect_to new_article_path
  	else
  		render 'new'
		end
	end

  def show
  	@user = User.find(params[:id])
  end

private 
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
