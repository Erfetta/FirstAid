require "application_system_test_case"

class ReportFlowTest < ApplicationSystemTestCase

  test "user creates a report and operator accepts it" do
    # Utente accede al sistema e crea un report
    puts "Inizio Test"

    visit "http://localhost:3000/login"
    fill_in "Email", with: "prova5@gamil.com"
    fill_in "Password", with: "123456"
    click_on "Login"

    puts "Accesso con utente"
    # L'utente compila il questionario
    visit "http://localhost:3000/new"

    puts "Apertura pagina new report"
    # Clic sul primo pulsante dello slide attivo
    find("button#true1").click
   
    find('.button-container_user button:last-of-type').click

    find('#sendBtn2').click

    click_on "INVIA"

    puts "Report inviato"
    # Verifica che l'utente sia sulla pagina di attesa
    assert current_url.start_with?("http://localhost:3000/waiting")
    assert_text "Attendere, uno dei nostri operatori risponderà a breve ..."

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

    sleep 2
    rep_id = Report.last.id
    puts "ID del report più recente: #{rep_id}"

    visit "http://localhost:4000/show_report/#{rep_id}"
    puts "Apertura primo report"
    # Verifica che l'URL contenga la stringa 'show_report'
    assert_includes current_url, "show_report"
    sleep 1

    first_report_info = find(".report_info_c1")
    # Estrai l'ID del report
    report_id = first_report_info.find("p", text: "Richiesta n°:").text.split(":").last.strip

    # Stampa l'ID per il debug
    puts "ID del report aperto: #{report_id}"

    sleep 1 # attendo che la pagina abbia finito di leggere dal db i dati necessari
    
    # Clicca sul bottone 'Prendi incarico' per il report
    find(".chooseReportBtn").click
    puts "Prendi incarico"

    find('.map-chat_selector_button2').click
    puts "Apertura chat"

    sleep 1

    fill_in "message-input", with: "Salve, mi dica della sua emergenza"
    click_on "Invia"
    puts "Messaggio inviato"

    sleep 2

    # Torno alla pagina utente
    visit "http://localhost:3000/"

    page.driver.browser.manage.window.resize_to(640, 1080)
    puts "Resize pagina da operatore a utente"

    sleep 1

    visit "http://localhost:3000/chat/#{report_id}"
    puts "Apertura chat"

    assert_text "Salve, mi dica della sua emergenza"

    fill_in "message-input", with: "Ho bisogno di un ambulanza al più presto"
    click_on "Invia"
    
  end
end
