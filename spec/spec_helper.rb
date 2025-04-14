$: << File.expand_path("../../lib", __FILE__)

require 'database_cleaner-mongoid'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :deletion
  end

  config.after(:each) do
    DatabaseCleaner[:mongoid].clean
  end
end

require 'mongoid'
require 'mongoid_taggable'

Mongoid.load!("spec/mongoid.yml", :test)
