class MailshotsController < ApplicationController
  def new
  	@mailshot = Mailshot.new
  end

  def create
  	mailshot = Mailshot.new(mailshot_params)
  	mailshot.user_id = params[:user_id]
  	mailshot.save
  	redirect_to :back
  end

  def destroy
  end

  private
  	def mailshot_params
  		params.require(:mailshot).permit(:body, :grade, :title)
  	end
end
