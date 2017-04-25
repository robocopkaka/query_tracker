module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])

    # devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
  end

end

DeviseController.send :include, DevisePermittedParameters