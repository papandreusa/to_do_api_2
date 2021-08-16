RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before do |example|
    DatabaseCleaner.clean_with(:truncation) unless example.metadata[:skip_db_cleaner]
  end

  config.after(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
end
