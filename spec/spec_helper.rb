require 'rubygems'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

    # Loading more in this block will cause your tests to run faster. However,
    # if you change any configuration or code from libraries loaded here, you'll
    # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV['RAILS_ENV'] = 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require "mocha/setup"

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  ActiveSupport::Dependencies.clear

  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"
    #config.before(:suite) do
      #DatabaseCleaner.strategy = :transaction
      #DatabaseCleaner.clean_with(:truncation)
    #end

    #config.before(:each) do
      #DatabaseCleaner.start
    #end

    #config.after(:each) do
      #DatabaseCleaner.clean
    #end
    config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
    config.use_transactional_fixtures = false
 
#config.before(:suite) do
  ## Do truncation once per suite to vacuum for Postgres
  #DatabaseCleaner.clean_with :truncation
  ## Normally do transactions-based cleanup
  #DatabaseCleaner.strategy = :transaction
#end
 
#config.around(:each) do |spec|
  #if spec.metadata[:js] || spec.metadata[:test_commit]
    ## JS => run with PhantomJS that doesn't share connections => can't use transactions
    ## deletion is often faster than truncation on Postgres - doesn't vacuum
    ## no need to 'start', clean_with is sufficient for deletion
    ## Devise Emails: devise-async sends confirmation on commit only! => can't use transactions
    #spec.run
    #DatabaseCleaner.clean_with :deletion
  #else
    ## No JS/Devise => run with Rack::Test => transactions are ok
    #DatabaseCleaner.start
    #spec.run
    #DatabaseCleaner.clean
    ## see https://github.com/bmabey/database_cleaner/issues/99
    #begin
      #ActiveRecord::Base.connection.send(:rollback_transaction_records, true)
    #rescue
    #end
  #end
#end

    config.include Devise::TestHelpers, :type => :controller
    config.include FactoryGirl::Syntax::Methods

  end




