class AutopsyPoltergeist
  class << self
    def init(name=:poltergeist, options = {})
      @log = StringIO.new
      Capybara.register_driver name do |app|
        Capybara::Poltergeist::Driver.new(app, options.merge(logger: @log))
      end
    end

    def get_console_messages(capybara_page)
      lines = []
      @log.each_line do |line|
        lines << line
      end
      lines
    end
  end
end
