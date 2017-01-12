class ReceiptsController < ApplicationController

	def create
		receipt = Receipt.new(receipt_params)
		receipt.user_id = params[:user_id]
		receipt.save

		redirect_to :back
	end

	private
		def receipt_params
			params.require(:receipt).permit(:date, :receiptFile)
		end
end
