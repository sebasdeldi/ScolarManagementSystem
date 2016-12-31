class UsersController < ApplicationController
	def index
		@students = User.with_role :student
		@teachers = User.with_role :teacher
	end

	def show
		@user = User.find(params[:id])
		if !@user.debts.nil?
			debts_str = @user.debts
			@debts_array = debts_str.split(/(?<=[0-9][0-9][0-9][0-9])/)
			if params[:delete].present?
				toDelete = params[:delete]
				@debts_array.delete_if {|x| x == toDelete }
				debts_str = @debts_array.join
				@user.debts = debts_str
				@user.save
				redirect_to @user
			end
		end
		if request.patch?
			@user.update(user_params)
			redirect_to @user
		end
	end

	private
		def user_params
			if @user.debts.nil?
				params.require(:user).permit(:debts)
			else
				params.require(:user).permit(:add_debt)
			end
		end
end
