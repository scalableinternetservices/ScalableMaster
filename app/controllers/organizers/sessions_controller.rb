class Organizers::SessionsController < Devise::SessionsController
  before_filter :if_signed_in, except: [:destroy]

  private 
    def if_signed_in
      if participant_signed_in? || organizer_signed_in?
        redirect_to root_path
      end
    end
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
