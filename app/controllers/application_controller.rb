class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_markers

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :business])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :business])
  end

  def after_sign_in_path_for(_resource)
    user_dashboard_path
  end

  def set_markers
    @markers = [{
      lat: 55.95794206181086,
      lng: -3.206466979961612
    }]
  end
end
