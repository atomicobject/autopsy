Gem::Specification.new do |s|
  s.name        = 'autopsy'
  s.version     = '0.1.1'
  s.date        = '2015-06-15'
  s.summary     = "Emit helpful artifacts for failed Capybara feature tests"
  s.description = "See error messages, screenshots, current HTML, and current Javascript console messages on feature test failures."
  s.authors     = ["Will Pleasant-Ryan"]
  s.email       = 'will.ryan@atomicobject.com'
  s.files       = ["lib/autopsy.rb"] + Dir[ "lib/autopsy/*.rb"]
  s.homepage    = 'https://github.com/atomicobject/autopsy'
  s.license     = 'MIT'
  s.add_runtime_dependency "awesome_print"
end
