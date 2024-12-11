require "test_helper"

class User::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should create user and redirect to login" do
    post registration_create_path, params: { 
      user: {
        email: "testuser@example.com",
        password: "password123",
        password_confirmation: "password123",
        name: "Test",
        surname: "User",
        sex: "M",
        age: 30
      }
    }

    # Verifica che l'utente venga creato nel database
    assert User.exists?(email: "testuser@example.com")

    # Verifica che l'utente venga reindirizzato alla pagina di login
    assert_redirected_to login_path
    follow_redirect!

    # Verifica che la pagina di login sia visibile
    assert_select "h2", text: "Login Utente"
  end
end
