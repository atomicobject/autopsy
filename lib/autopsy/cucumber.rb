require 'capybara/cucumber'
require_relative '../autopsy'

Autopsy.artifacts_path = "./features/artifacts"

After do |scenario|
  if scenario.failed?
    location = if (scenario.respond_to? :location)
      scenario.location
    else
      scenario
    end
    file_base = "#{location.file.split("/").last.split(".").first}-#{location.line}"
    exception = if (scenario.respond_to? :exception)
      scenario.exception
    else
      scenario.instance_variable_get("@result").exception ## boo cucumber bug
    end
    Autopsy.perform(page, file_base, exception)
  end
end

