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
end
