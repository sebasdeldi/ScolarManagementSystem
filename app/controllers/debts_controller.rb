class DebtsController < ApplicationController

	def create
		debt = Debt.new(debt_params)
		debt.user_id = params[:user_id]
		debt.save

		redirect_to :back
	end

	def destroy
		debt = Debt.find(params[:debt_id])
		debt.destroy
		redirect_to :back
	end

	private
		def debt_params
			params.require(:debt).permit(:date, :description)
		end
end
