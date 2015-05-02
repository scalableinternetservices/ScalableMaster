class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 #  before_action :set_resource_url

 #  def after_sign_in_path_for(resource)
 #  	stored_location_for(resource)
	#   # stored_location_for(resource) ||
	#     # if resource.is_a?(Participant)
	#     #   publisher_url
	#     # else
	#     #   super
	#     # end
	# end

	# private
	#   def set_resource_url
	#   	store_location_for(:participant, root_url)
	#   end
end
