class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.admin?
      root_path
    else
      new_search_path #your path
    end
  end
end
