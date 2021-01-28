require 'coveralls'
Coveralls.wear_merged!('rails')

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end
require 'rspec/rails'
require 'spec_helper'
require 'webmock/rspec'
require 'rspotify'
require 'auth_helper'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include Shoulda::Matchers::ActiveRecord, type: :model
  config.include ResponseJson
  config.before(:each) do
    fixture_file = File.open("#{fixture_path}/search_results.json").read
    stub_request(
      :get,
      'https://api.spotify.com/v1/search?limit=20&offset=0&q=All%20I%20Want%20for%20Christmas%20Is%20You&type=track'
     ).to_return(status: 200, body: fixture_file, headers: {})
  end
  config.include AuthHelper
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  if config.files_to_run.one?
    config.default_formater ='doc'
  end
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
  config.exect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
