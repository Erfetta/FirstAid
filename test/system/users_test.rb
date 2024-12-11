require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "user can register, login, and view profile" do
    # Step 1: Registrazione
    visit new_user_registration_path  # Visita la pagina di registrazione

    assert_selector "h2", text: "Registrazione Utente"

    # Compila il modulo di registrazione
    fill_in "Email", with: "testuser@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    fill_in "Name", with: "Test"
    fill_in "Surname", with: "User"
    select "Male", from: "Sex"
    fill_in "Age", with: 30

    # Invia il modulo di registrazione
    click_on "Sign up"

    # Step 2: Login
    visit login_path  # Vai alla pagina di login
    fill_in "Email", with: "testuser@example.com"
    fill_in "Password", with: "password123"
    click_on "Login"  # Verifica che il pulsante abbia il testo "Login"

    # Step 3: Profilo utente
    assert_current_path("/profile")
  end
end
