class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.admin?
      root_path
    else
      edit_user_path(current_user) #your path
    end
  end

end
