class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_role
 
  # rescue_from CanCan::AccessDenied do |exception|
	 #  flash[:warning] = exception.message
	 #  redirect_to root_path
  # end

  def current_role
    if user_signed_in?
      @current_role ||= current_user.roles.pluck(:name)
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :firstname, :lastname, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


end
