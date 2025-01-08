module Supervisorpage
  class LoginController < ApplicationController

    def new
      # Mostra la pagina di login
      render 'supervisorpage/login/supervisor_login'
    end

    def create
      supervisor = Supervisor.find_by(email: params[:supervisor][:email])

      if supervisor && supervisor.valid_password?(params[:supervisor][:password])

        otp = rand(100_000..999_999).to_s
        supervisor.update(otp: otp, otp_expires_at: 10.minutes.from_now)

        # Log per confermare che il codice OTP è stato generato
        Rails.logger.info "OTP generated: #{otp}"
    
        # Invia il codice OTP via email
        Rails.logger.info "Sending OTP email..."
        OperatorMailer.send_otp(supervisor).deliver_now
        Rails.logger.info "OTP email sent successfully!"

        # Salva l'email del supervisore nella sessione per il passaggio successivo
        session[:supervisor_email] = supervisor.email
    
        # Reindirizza alla pagina di verifica OTP
        redirect_to verify_otp_path, notice: 'Un codice OTP è stato inviato al tuo indirizzo email.'
      else
        flash.now[:alert] = 'Credenziali non valide. Riprova.'
        render 'supervisorpage/login/supervisor_login'
      end
    end

    def destroy
      sign_out(current_supervisor)  # Esegui il logout del supervisor
      session.delete(:supervisor_id)  # Cancella l'ID dalla sessione
      redirect_to root_path
    end

    def verify_otp
      # Mostra la pagina per inserire l'OTP
      if request.get?
        render 'supervisorpage/login/verify_otp'
      elsif request.post?
        supervisor = Supervisor.find_by(email: session[:supervisor_email])

        if supervisor && supervisor.otp == params[:otp] && supervisor.otp_expires_at > Time.current
          # Se l'OTP è corretto e non scaduto, logga l'utente
          sign_in(:supervisor, supervisor)
          session[:supervisor_id] = supervisor.id
          redirect_to root_path, notice: 'Accesso effettuato con successo.'
        else
          # OTP non valido o scaduto
          flash.now[:alert] = 'Codice OTP non valido o scaduto. Riprova.'
          render 'supervisorpage/login/verify_otp'
        end
      end
    end

  end
end