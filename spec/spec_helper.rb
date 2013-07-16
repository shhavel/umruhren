$:.unshift File.expand_path("../lib/promo")
require 'umruhren'

RSpec.configure do |config|
  config.mock_with :rspec
end
