# test_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

# Esempio di backup e ripristino con Postgres

class ActiveSupport::TestCase

  self.use_transactional_tests = false
  fixtures :all
  
  setup do
    system("cp db/development.sqlite3 db/development_backup.sqlite3")
  end
  teardown do
    system("rm db/development.sqlite3")
    system("cp db/development_backup.sqlite3 db/development.sqlite3")
    system("rm db/development_backup.sqlite3")
  end
end

