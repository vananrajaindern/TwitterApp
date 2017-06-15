class UsersController < ApplicationController

	#in ruby the @ refers to an instance variable 
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			redirect_to @user, notice: " Thank you for signing up for Twitter!"
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

end

