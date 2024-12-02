module Operatorpage
  class LoginController < ApplicationController
    def new
      # Mostra la pagina di login
      render 'operatorpage/login/op_login'
    end

    def create
      operator = Operator.find_by(email: params[:operator][:email])
    
      if operator && operator.valid_password?(params[:operator][:password])
        # Genera un codice OTP e salva l'ora di scadenza
        otp = rand(100_000..999_999).to_s
        operator.update(otp: otp, otp_expires_at: 10.minutes.from_now)
    
        # Log per confermare che il codice OTP è stato generato
        Rails.logger.info "OTP generated: #{otp}"
    
        # Invia il codice OTP via email
        Rails.logger.info "Sending OTP email..."
        OperatorMailer.send_otp(operator).deliver_now
        Rails.logger.info "OTP email sent successfully!"
    
        # Salva l'email dell'operatore nella sessione per il passaggio successivo
        session[:operator_email] = operator.email
    
        # Reindirizza alla pagina di verifica OTP
        redirect_to verify_otp_path, notice: 'Un codice OTP è stato inviato al tuo indirizzo email.'
      else
        flash.now[:alert] = 'Credenziali non valide. Riprova.'
        render 'operatorpage/login/op_login'
      end
    end
    

    def destroy
      # Logout dell'operatore
      sign_out(current_operator)
      session.delete(:operator_id)
      redirect_to root_path
    end

    def verify_otp
      # Mostra la pagina per inserire l'OTP
      if request.get?
        render 'operatorpage/login/verify_otp'
      elsif request.post?
        operator = Operator.find_by(email: session[:operator_email])

        if operator && operator.otp == params[:otp] && operator.otp_expires_at > Time.current
          # Se l'OTP è corretto e non scaduto, logga l'utente
          sign_in(:operator, operator)
          session[:operator_id] = operator.id
          redirect_to root_path, notice: 'Accesso effettuato con successo.'
        else
          # OTP non valido o scaduto
          flash.now[:alert] = 'Codice OTP non valido o scaduto. Riprova.'
          render 'operatorpage/login/verify_otp'
        end
      end
    end
  end
end
