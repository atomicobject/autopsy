require 'rspec'
require 'capybara/rspec'
require_relative '../autopsy'

Autopsy.artifacts_path = "./spec/artifacts"

RSpec.configure do |config|
  config.after :each, type: :feature do
    example = RSpec.current_example
    file_base = "#{example.file_path.split("/").last.split(".").first}-#{example.metadata[:line_number]}"
    Autopsy.perform(page, file_base, example.exception)
  end
end
