autopsy
=======

Emit helpful artifacts on Capybara Webkit test failures

Supported test frameworks:
- RSpec
- Cucumber

On Failure, output includes:
- Error stack trace
- current screenshot
- current HTML
- contents of Javascript console messages

Usage:
- RSpec: in spec_helper.rb, require 'autopsy/rspec'
- Cucumber: in env.rb, require 'autopsy/cucumber'

TODO
- auto-remove old artifacts at start of test suite
- explicit tags for certain options (e.g. screenshots)
