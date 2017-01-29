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
		@notes = Note.all.paginate(:page => params[:page], :per_page => 15)
		@students = User.with_role(:student)
		@user = User.find(params[:id])


		if params[:search]
			@students = User.search_students(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
		end

		if params[:subject_search]
			@notes = Note.search_note_by_subject(params[:subject_search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
		end

		if params[:reset_subjects_search]
			@notes = Note.all
		end

		#receipts creation code
		@receipt = Receipt.new

		#note creation code
		@note = Note.new

		#debt creation code
		@debt = Debt.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		if user.update!(user_update_params)
			redirect_to user
		else
			redirect_to root_path
		end
	end

	private
		def user_update_params
			params.require(:user).permit(:username, :names, :last_names, :guardian, :phone, :identification, :role, :password, :password_confirmation)
		end

		def user_params
			if @user.debts.nil?
				params.require(:user).permit(:debts)
			else
				params.require(:user).permit(:add_debt)
			end
		end
end
