class UsersController < ApplicationController

	def new
		if current_user
			redirect_to user_path(current_user)
		else 
			@user = User.new
		end 
	end 

	def create
		@user = User.new(user_params)
		if @user.save
			login(@user)
			redirect_to user_path(@user)
		else
			render 'new'
		end 
	end 

	def show
		@user = User.find(params[:id])
		@followers = @user.followers
		@subscriptions = @user.games
    @a = 0
	end 

	private 
	def user_params
		params.require(:user).permit(:username, :password)
	end 
end 