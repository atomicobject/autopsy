class AutopsyWebkit
  class << self
    def get_console_messages(capybara_page)
      capybara_page.driver.console_messages
    end
  end
end
