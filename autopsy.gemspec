Gem::Specification.new do |s|
  s.name        = 'autopsy'
  s.version     = '0.0.5'
  s.date        = '2015-01-20'
  s.summary     = "Emit helpful artifacts for failed Capybara (Webkit) feature tests"
  s.description = "See error messages, screenshots, current HTML, and current Javascript console messages on feature test failures."
  s.authors     = ["Will Pleasant-Ryan"]
  s.email       = 'will.ryan@atomicobject.com'
  s.files       = ["lib/autopsy.rb"] + Dir[ "lib/autopsy/*.rb"]
  s.homepage    = 'https://github.com/atomicobject/autopsy'
  s.license     = 'MIT'
end
