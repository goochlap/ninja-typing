class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(_resource)
    # stored_location_for(resource)
    if current_user.avatar
      user_avatar_board_path(current_user, current_user.avatar, current_user.avatar.board)
    else
      new_user_avatar_path(current_user)
    end
  end
end
