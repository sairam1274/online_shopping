class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActionController::RoutingError, with: :render_404_page

  protected
    def render_404_page
      render "app/error_pages/application/routing_error.html.erb", status: 404
    end


  protected

  def configure_permitted_parameters
      
      devise_parameter_sanitizer.for(:sign_up) do |u|
    	u.permit :name, :address, :password, :gender, :email, :Password_confirmation
     end
      
      devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit :name, :address, :password, :gender, :email, :Password_confirmation, :current_password
     end
    
  end

end
