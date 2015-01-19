require 'capybara/cucumber'
require_relative '../autopsy'

Autopsy.artifacts_path = "./features/artifacts"

After do |scenario|
  if scenario.failed?
    file_base = "#{scenario.feature.file.split("/").last.split(".").first}-#{scenario.feature.line}"
    Autopsy.perform(page, file_base, scenario.exception)
  end
end

