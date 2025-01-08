class SupervisorMailer < ApplicationMailer
  def send_pass(name, email, pass, workplace)
    @name = name
    @email = email
    @pass = pass
    @workplace = workplace
    mail(to: email, subject: 'Registrazione Operatore - Credenziali di accesso')
  end
  def send_otp(supervisor)
    @supervisor = supervisor
    @otp = supervisor.otp
    mail(to: @supervisor.email, subject: 'Il tuo codice OTP per l’accesso')
  end
end