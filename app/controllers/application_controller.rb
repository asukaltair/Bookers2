class ApplicationController < ActionController::Base

	before_action :configure_purmitted_parameters, if: :devise_controller?

	protected

	def configure_purmitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

end
