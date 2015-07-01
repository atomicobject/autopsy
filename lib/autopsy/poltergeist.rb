require 'autopsy'

class AutopsyPoltergeist
  class << self
    def init(name=:poltergeist, options = {})
      Autopsy.driver_console_messages_map[name] = AutopsyPoltergeist
      @log = StringIO.new
      Capybara.register_driver name do |app|
        Capybara::Poltergeist::Driver.new(app, options.merge(phantomjs_logger: @log))
      end
    end

    def get_console_messages(capybara_page)
      @log.string.lines
    end
  end
end
