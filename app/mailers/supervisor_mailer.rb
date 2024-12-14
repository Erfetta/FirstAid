class SupervisorMailer < ApplicationMailer
  def send_pass(name, email, pass, workplace)
    @name = name
    @email = email
    @pass = pass
    @workplace = workplace
    mail(to: email, subject: 'Registrazione Operatore - Credenziali di accesso')
  end
end