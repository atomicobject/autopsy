require 'awesome_print'
require 'capybara'
require_relative 'autopsy/webkit'
require_relative 'autopsy/poltergeist'

class Autopsy
  class << self
    attr_accessor :artifacts_path
    attr_accessor :driver_console_messages_map
  end



  def self.perform(capybara_page, test_base, exception)
    file_base = "#{File.expand_path(Autopsy.artifacts_path)}/#{test_base}"
    if exception != nil
      capybara_page.save_screenshot "#{file_base}.png"
      capybara_page.save_page "#{file_base}.html"
      if (Autopsy.driver_console_messages_map[Capybara.current_driver])
        msgs = Autopsy.driver_console_messages_map[Capybara.current_driver].get_console_messages(capybara_page).ai(html: true)
        File.open("#{file_base}_msgs.html", 'w') {|f| f.write(msgs) }
      end
      File.open("#{file_base}_error.log", 'w') do |f|
        f.write exception.message
        f.write "\n"
        (exception.backtrace || []).each do |l|
          f.write l
          f.write "\n"
        end
      end
    end
  end
end

Autopsy.artifacts_path = "." # default
Autopsy.driver_console_messages_map = {
  webkit: AutopsyWebkit,
  poltergeist: AutopsyPoltergeist
}
