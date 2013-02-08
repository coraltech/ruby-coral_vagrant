
require 'rspec'
require 'stringio'
require 'coral_vagrant'

require 'coral_test_kernel'

#-------------------------------------------------------------------------------

RSpec.configure do |config|
  config.mock_framework = :rspec
  config.color_enabled  = true
  config.formatter      = 'documentation'
end