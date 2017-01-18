class UsersController < ApplicationController

	def index
		if params[:search]
			@students = User.search_students(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
			@teachers = User.search_teachers(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
		else
			@students = User.with_role(:student).paginate(:page => params[:page], :per_page => 15)
			@teachers = User.with_role(:teacher).paginate(:page => params[:page], :per_page => 15)
		end
	end

	def show
		@notes = Note.all
		@students = User.with_role(:student)
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

		if params[:search]
			@students = User.search_students(params[:search]).order("created_at DESC")
		end

		#receipts creation code
		@receipt = Receipt.new

		#note creation code
		@note = Note.new
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
