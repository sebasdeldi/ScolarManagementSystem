class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # When user with role of teacher or student logs in, it takes it to the show view of users.
  def after_sign_in_path_for(resource)
  	unless current_user.has_role? :admin
  		user_path(current_user)
  	else
  		root_path
  	end
  end

  # Code for deleteing PDF files (receipts) every 90 days
  def auto_delete_receipts
    #get user id from params or as a method parameter
    user = params[:id]

    user.receipts.each do |receipt|
      #check if receipt is three months old
        receipt.remove_receiptFile!
        receipt.save
      #end
    end
  end
end
