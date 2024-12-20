require "application_system_test_case"

class ReportFlowTest < ApplicationSystemTestCase
  test "user creates a report and operator accepts it" do
    # Utente accede al sistema e crea un report
    puts "Inizio Test"

#    visit "http://localhost:3000/login"
#    fill_in "Email", with: "prova5@gamil.com"
#    fill_in "Password", with: "123456"
#    click_on "Login"

#    puts "Accesso con utente"
    # L'utente compila il questionario
#    visit "http://localhost:3000/new"

#    puts "Apertura pagina new report"
    # Clic sul primo pulsante dello slide attivo
#    find("button#true1").click
   
#    find('.button-container_user button:last-of-type').click

#    find('#sendBtn2').click

#    click_on "INVIA"

#    puts "Report inviato"
    # Verifica che l'utente sia sulla pagina di attesa
#    assert current_url.start_with?("http://localhost:3000/waiting")
#    assert_text "Attendere, uno dei nostri operatori risponderà a breve ..."

    # Resize pagina 
    page.driver.browser.manage.window.resize_to(1920, 1080)
    puts "Resize pagina da utente a operatore"

    # Operatore accede al sistema e accetta il report
    visit "http://localhost:4000/login"
    fill_in "Email", with: "operator@example.com"
    fill_in "Password", with: "password123"
    click_on "Login"

    puts "Accesso con operatore"

    otp_code = Operator.find_by(email: "operator@example.com").otp
    fill_in "OTP", with: otp_code
    click_on "Verifica"
    
    puts "Inserito OTP"

    #within("#reports-section") do
    #  first(".report_area_operator").click
    #end

    sleep 10 # attendo che caricano i report
    reports_section = find(".reports_section_operator")
    first_report = reports_section.all(".report_area_operator").first    
    first_report.click

    puts "Apertura primo report"
    # Verifica che l'URL contenga la stringa 'show_report'
    assert_includes current_url, "show_report"

    first_report = find(".report_info_c1")
    # Estrai l'ID del report
    report_id = first_report.find("p", text: "Richiesta n°:").text.split(":").last.strip

    # Stampa l'ID per il debug
    puts "ID del report: #{report_id}"

    sleep 1 # attendo che la pagina abbia finito di leggere dal db i dati necessari
    
    # Clicca sul bottone 'Prendi incarico' per il report
    find(".chooseReportBtn").click
    puts "Prendi incarico"

    sleep 1

    #find('.select-chat_button').click
    
  end
end
