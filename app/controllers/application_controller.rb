class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  # def after_sign_in_path_for(resource) 
  #   return dashboard_path(resource)
  # end 


  protected

    def configure_permitted_parameters
      keys = [:first_name, :last_name, :job_seeker, :employer]
      devise_parameter_sanitizer.permit(:sign_up, keys: keys)
      devise_parameter_sanitizer.permit(:account_update, keys: keys)
    end
end
