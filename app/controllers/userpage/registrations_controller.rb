class Userpage::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]


  def new
    render 'userpage/profiles/user_registration'
  end
    
  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        redirect_to login_path
      else
        expire_data_after_sign_in!
        redirect_to login_path    
      end  
    else
      clean_up_passwords(resource)
      set_minimum_password_length
      flash.now[:alert] = resource.errors.full_messages.join(', ')
      render 'userpage/profiles/user_registration'
    end
  end

  protected

  # Aggiungi i parametri personalizzati
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :sex, :age])
  end
end
