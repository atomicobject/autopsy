autopsy
=======

Emit helpful artifacts on Capybara test failures

Supported test frameworks:
- RSpec
- Cucumber

Supported Capybara drivers:
- Webkit
- Poltergeist
- Selenium (no console log though)

On Failure, output includes:
- Error stack trace
- current screenshot
- current HTML
- contents of Javascript console messages

Usage:
- RSpec: in spec_helper.rb, require 'autopsy/rspec'
- Cucumber: in env.rb, require 'autopsy/cucumber'
- Poltergeist: require 'autopsy/poltergeist' and call AutopsyPoltergeist.init before you set your default driver. 
  This will set up a custom poltergeist driver so I can grab console messages. You can pass it a hash of other options.

TODO
- auto-remove old artifacts at start of test suite
- explicit tags for certain options (e.g. screenshots)
