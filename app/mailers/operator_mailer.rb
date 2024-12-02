class OperatorMailer < ApplicationMailer
  def send_otp(operator)
    @operator = operator
    @otp = operator.otp
    mail(to: @operator.email, subject: 'Il tuo codice OTP per l’accesso')
  end
end
