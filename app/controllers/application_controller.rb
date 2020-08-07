class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters,if: :devise_controller?
  #  before_action :authenticate_user!


  #  def after_sign_out_path_for
  #   root_path
  #  end
  #  private

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth])
   end
end