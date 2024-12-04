class Userpage::RegistrationsController < Devise::RegistrationsController
  def new
    # Imposta l'oggetto `@user` come richiesto da Devise
    build_resource({})
    super # Facoltativo: puoi usarlo per mantenere la funzionalità di Devise
  end
end