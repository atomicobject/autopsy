require 'rspec'
require 'capybara/rspec'
require 'awesome_print'

class Autopsy
  class << self
    attr_accessor :artifacts_path

    def perform(capybara_page, test_base, exception)
      file_base = "#{Autopsy.artifacts_path}/#{test_base}"
      if exception != nil
        capybara_page.save_screenshot "#{file_base}.png"
        capybara_page.save_page "#{file_base}.html"
        msgs = capybara_page.driver.console_messages.ai(html: true)
        File.open("#{file_base}_msgs.html", 'w') {|f| f.write(msgs) }
        File.open("#{file_base}_error.log", 'w') do |f|
          f.write exception.message
          f.write "\n"
          exception.backtrace.each do |l|
            f.write l
            f.write "\n"
          end
        end
      end
    end
  end
end

Autopsy.artifacts_path = "." # default

