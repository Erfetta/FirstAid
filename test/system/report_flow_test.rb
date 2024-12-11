require "application_system_test_case"

class ReportFlowTest < ApplicationSystemTestCase
  test "user creates a report and operator accepts it" do
    # Utente accede al sistema e crea un report

    visit "http://localhost:3000/login"
    fill_in "Email", with: "prova5@gamil.com"
    fill_in "Password", with: "123456"
    click_on "Login"

    # L'utente compila il questionario
    visit "http://localhost:3000/new"

    # Clic sul primo pulsante dello slide attivo
    find("button#true1").click
   
    find('.button-container_user button:last-of-type').click

    find('#sendBtn2').click

    click_on "INVIA"

    # Verifica che l'utente sia sulla pagina di attesa
    assert current_url.start_with?("http://localhost:3000/waiting")
    assert_text "Attendere, uno dei nostri operatori risponderà a breve ..."

    # Operatore accede al sistema e accetta il report
    visit "http://localhost:4000/login"
    fill_in "Email", with: "fettuccia56@gmail.com"
    fill_in "Password", with: "password123"
    click_on "Login"

    otp_code = Operator.find_by(email: "fettuccia56@gmail.com").otp
    fill_in "OTP", with: otp_code
    click_on "Verifica"
    
    within("#reports-section") do
      first(".report_area_operator").click
    end

    # Verifica che l'URL contenga la stringa 'show_report'
    assert_includes current_url, "show_report"

    first_report = find(".report_info_c1")

    # Estrai l'ID del report
    report_id = first_report.find("p", text: "Richiesta n°:").text.split(":").last.strip

    # Stampa l'ID per il debug
    puts "ID del report: #{report_id}"


      # Clicca sul bottone 'Prendi incarico' per il report
    find(".chooseReportBtn").click
    sleep 40

    find('.select-chat_button').click


    
  end
end
