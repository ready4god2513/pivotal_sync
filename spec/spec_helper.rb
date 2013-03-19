require "bundler"
require "fileutils"

Bundler.require(:default, :runtime, :test)
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "pivotal_sync"
require "rspec"
require "rspec/autorun"

PROJECT_ID = ENV["PROJECT_ID"] || 784131
TOKEN = "f95c5605f1658de48719ec0daa2f24ca"


PivotalSync::Client.token = TOKEN
# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),"support","**","*.rb"))].each {|f| require f}


RSpec.configure do |config|
  config.add_setting :fixture_path
  config.fixture_path = "#{File.expand_path(File.dirname(__FILE__))}/fixtures/"
  config.before :each do
    PivotalSync::Client.clear_connections
  end
end