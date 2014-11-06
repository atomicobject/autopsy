require 'rspec'
require 'capybara/rspec'
require 'awesome_print'

class Autopsy
  class << self
    attr_accessor :artifacts_path
  end
end

Autopsy.artifacts_path = "./spec/artifacts" # default

RSpec.configure do |config|
  config.after :each, type: :feature do
    example = RSpec.current_example
    if example.exception != nil
      file_base = "#{Autopsy.artifacts_path}/#{example.file_path.split("/").last.split(".").first}-#{example.metadata[:line_number]}"
      page.save_screenshot "#{file_base}.png"
      page.save_page "#{file_base}.html"
      msgs = page.driver.console_messages.ai(html: true)
      File.open("#{file_base}_msgs.html", 'w') {|f| f.write(msgs) }
      File.open("#{file_base}_error.log", 'w') do |f|
        f.write example.exception.message
        f.write "\n"
        example.exception.backtrace.each do |l|
          f.write l
          f.write "\n"
        end
      end
    end
  end
end
