# test_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

# Esempio di backup e ripristino con Postgres

class ActiveSupport::TestCase

  self.use_transactional_tests = false
  fixtures :all
  
end

